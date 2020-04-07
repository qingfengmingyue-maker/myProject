package com.platform.common.utils.ce;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import org.apache.taglibs.standard.lang.support.ExpressionEvaluatorManager;

public class SelectTag extends TagBase{

		  private static final long serialVersionUID = 1L;
		  protected String list;
		  protected String multiple;
		  protected String headValue;

		  public int doStartTag()
		    throws JspException
		   {
			    StringBuffer commonHTML = generateHTML();
			    ArrayList valueList = new ArrayList();
			    StringBuffer buffer = new StringBuffer();
			    if (this.list == null) {
			      throw new JspException("SelectTag.list is null");
			    }
			    if (this.id == null) {
			      this.id = this.name;
			    }
			    if (this.value != null) {
			      if ((this.value.startsWith("{")) && (this.value.endsWith("}"))) {
			        this.value = this.value.substring(1, this.value.length() - 1);
			        String[] values = this.value.split(",");
			        for (int i = 0; i < values.length; i++) {
			          if ((values[i].startsWith("'")) && (values[i].endsWith("'"))) {
			            values[i] = values[i].substring(1, values[i].length() - 1);
			          }
			          valueList.add(values[i].trim());
			        }
			      }
			    }

			    buffer.append("<select");
			    buffer.append(commonHTML);
			    if (this.id != null) {
			      buffer.append(" id=\"").append(this.id).append("\"");
			    }
			    buffer.append(">");

			    if ((this.headValue != null) && (!"".equals(this.headValue))) {
			      buffer.append("<option value=\"").append("\"");
			      buffer.append(">").append(this.headValue).append("</option>");
			    }
			    if ((this.list.startsWith("#{")) && (this.list.endsWith("}"))) {
			      String[] items = this.list.substring(0, this.list.length() - 1).substring(2).split(",");

			      if (items != null)
			        for (int i = 0; i < items.length; i++) {
			          String[] item = items[i].split(":");
			          if ((item == null) || (item.length != 2)) {
			            continue;
			          }
			          if ((item[0].startsWith("'")) && (item[0].endsWith("'"))) {
			            item[0] = item[0].substring(1, item[0].length() - 1);
			          }
			          if ((item[1].startsWith("'")) && (item[1].endsWith("'"))) {
			            item[1] = item[1].substring(1, item[1].length() - 1);
			          }
			          buffer.append("<option value=\"").append(item[0]).append("\"");

			          if (valueList.contains(item[0])) {
			            buffer.append(" selected");
			          }
			           buffer.append(">").append(item[1]).append("</option>");
			          }
			    }
			    else {
//			      Object obj = valueStack.findValue(this.list);
//			      if ((obj instanceof Map)) {
//			        Map map = (Map)obj;
//			        Iterator iterator = map.keySet().iterator();
//			        while (iterator.hasNext()) {
//			          Object itemKey = iterator.next();
//			          Object itemValue = map.get(itemKey);
//			          String keyText = itemKey.toString();
//			          String valueText = itemValue.toString();
//			          buffer.append("<option value=\"").append(keyText).append("\"");
//
//			          if (valueList.contains(keyText)) {
//			            buffer.append(" selected");
//			          }
//			          buffer.append(">").append(valueText).append("</option>");
//			        }
//			      }
			    }
			    buffer.append("</select>");

			    JspWriter writer = this.pageContext.getOut();
			    try {
			      writer.print(buffer.toString());
			    } catch (IOException e) {
			      throw new JspException(e.toString());
			    }
			    return 1;
			  
		  }

		  public int doEndTag() throws JspException {
		    clearValue();
		    this.list = null;
		    this.multiple = null;
		    return 6;
		  }

		  public void setList(String list) {
		    this.list = list;
		  }

		  public void setMultiple(String multiple) throws JspException {
		    this.multiple = multiple;
		    if ((multiple != null) && (multiple.startsWith("${")) && (multiple.endsWith("}")))
		    {
		      this.multiple = ((String)ExpressionEvaluatorManager.evaluate("multiple", multiple, Object.class, this, this.pageContext));
		    }
		  }

		  public void setHeadValue(String headValue)
		  {
		    this.headValue = headValue;
		  }
}
