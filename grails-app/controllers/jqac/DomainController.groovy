package jqac

import grails.converters.JSON

class DomainController {
	
	def index = {
	}
	def initval={
		def results=[]
		def domainname    = params.db_table
		def q_word      = params.q_word
		def field       = params.field
		def primary_key = params.primary_key
		def fieldInBF = primary_key[0].toUpperCase() + primary_key[1..-1]
		def domain= grailsApplication.getClassForName(domainname)
		
		if(!q_word.equals('') && !q_word.equals('null')){
			def domains
			
			if(primary_key.equals('id'))
				domains= domain."findBy${fieldInBF}"(Long.parseLong(q_word))
			else 
				domains= domain."findBy${fieldInBF}"(q_word)
			
			domains.each{
				results<<it."$field"
			}
		}
		render results as JSON
	}
	def getdata={
		def result=[:]
		def domainname    = params.domain
		def q_word      = params.q_word
		def page_num    =params.page_num
		def per_page    =params.per_page
		def field       = params.field
		def primary_key = params.primary_key
		def fieldInBF = field[0].toUpperCase() + field[1..-1]
		
		def select_field= params.select_field
		def order_field = params.order_field
		def order_by    =params.order_by
		
		def subset= []
		if(!(params.subset).equals(''))
		subset=params.subset.split(":")
		
		def show_field=[]
		if(!(params.show_field).equals(""))
		show_field=params.show_field.split(",")
		
		def hide_field=[]
		if(!(params.hide_field).equals(""))
		hide_field=params.hide_field.split(",")
		
		def offset = (Integer.parseInt(page_num) - 1) * Integer.parseInt(per_page);
		result["cnt_page"] = 0;
		result['candidate']=[]
		result['attached']=[]
		result['primary_key']=[]
		
		def domain= grailsApplication.getClassForName(domainname)
		def domains= domain."findAllBy${fieldInBF}Like"("%$q_word%", [max: per_page, offset:offset, sort:order_field, order:order_by])
		
		
		
		domains.each{
			
			result["cnt_page"]++			
			result['candidate']<<it."$field"
			
			if(!(primary_key.equals("null")||primary_key.equals("")))
			result['primary_key']<<it."$primary_key"
			
			if(select_field.equals("*")&&(subset.size()==0)){				
				result['attached'] << [["id", it.id],["name", it.name]]
			}else{
				
				def item= []
				def role= it
				if(show_field.size()!=0){
					show_field.each{
						
						item << ["$it", role."$it"]
					}
				}else{			
					subset.each{sub->
						
						if(hide_field.size()!=0){
							if(!hide_field.find{it==sub
							})
							item << ["$sub", role."$sub"]
						}else{
							item << ["$sub", role."$sub"]
						}
					}
				}
				
				
				result['attached'] << item
			}
		}
		result["cnt"]= domain."countBy${fieldInBF}Like"("%$q_word%")
		
		render result as JSON
	}
}
