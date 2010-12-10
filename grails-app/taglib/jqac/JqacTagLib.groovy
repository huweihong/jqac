package jqac


class JqacTagLib {
    static namespace= "jqac"

    def domain= { attrs, body ->
		
        def jsJQAC= """
            jQuery(document).ready(function(\$){
                \$('#${attrs.id}').ajaxComboBox(
                    ${createURL(attrs.domain, attrs.subset)},
                    {
                        'lang' : 'en',
                        'sub_info' : ${attrs.subInfo?:false},
                        'sub_as' : ${mapSubSetToSubAs(attrs.subset)},
                        'show_field' :"${attrs.showField?:''}",
                        'hide_field' :"${attrs.hideField?:''}",
                        'per_page' : ${attrs.pageSize?:10},
                        'navi_num' : ${attrs.naviNum?:5},
                        'navi_simple' : ${attrs.naviNum?:true},
                        'primary_key':"${attrs.primaryKey?:'id'}",
                        'field':"${attrs.field?:'name'}",
                        'order_field':"${attrs.orderField?:'name'}",
                        'order_by':"${attrs.orderBy?:'ASC'}",
                        'package' : ${attrs.package?:false},
                        'mini' : ${attrs.mini?:false},
                        'select_only':${attrs.selectOnly?:false},
                        'init_val' : [${attrs.initVal}],
                        'db_table':'${attrs.domain}'
                    }
                );
             });
        """


        out << "<div id='$attrs.id' style='$attrs.style'></div>"
        out << "<script type='text/javascript'>"<< jsJQAC << "</script>"
    }

    private def createURL(domain, subset){
        return "'/jqac/domain/getdata?subset=${createColsFrom(subset)}&domain=${domain}'"
    }

    private def createColsFrom(subset){
        return subset.collect{it.key}.join(':')
    }

    private def mapSubSetToSubAs(subset){
        return "{"+subset.collect{"'$it.key':'$it.value'"}.join(",")+"}"
    }
}
