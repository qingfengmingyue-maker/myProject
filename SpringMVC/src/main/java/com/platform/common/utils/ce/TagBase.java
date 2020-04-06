package com.platform.common.utils.ce;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.taglibs.standard.lang.support.ExpressionEvaluatorManager;
public class TagBase extends TagSupport{
		  protected String accesskey;
		  protected String cssClass;
		  protected String cssStyle;
		  protected String disabled;
		  protected String name;
		  protected String onblur;
		  protected String onchange;
		  protected String onclick;
		  protected String ondblclick;
		  protected String onfocus;
		  protected String onkeydown;
		  protected String onkeypress;
		  protected String onkeyup;
		  protected String onmousedown;
		  protected String onmousemove;
		  protected String onmouseout;
		  protected String onmouseover;
		  protected String onmouseup;
		  protected String onselect;
		  protected String required;
		  protected String size;
		  protected String tabindex;
		  protected String title;
		  protected String tooltip;
		  protected String value;

		  public void setId(String id)
		  {
		    this.id = id;
		    if ((id != null) && (id.startsWith("${")) && (id.endsWith("}")))
		      try {
		        this.id = ((String)ExpressionEvaluatorManager.evaluate("id", id, Object.class, this, this.pageContext));
		      }
		      catch (JspException e) {
		        e.printStackTrace();
		        throw new RuntimeException("setId fail.");
		      }
		  }

		  public void setAccesskey(String accesskey) throws JspException
		  {
		    this.accesskey = accesskey;
		    if ((accesskey != null) && (accesskey.startsWith("${")) && (accesskey.endsWith("}")))
		    {
		      this.accesskey = ((String)ExpressionEvaluatorManager.evaluate("accesskey", accesskey, Object.class, this, this.pageContext));
		    }
		  }

		  public void setCssClass(String cssClass) throws JspException
		  {
		    this.cssClass = cssClass;
		    if ((cssClass != null) && (cssClass.startsWith("${")) && (cssClass.endsWith("}")))
		    {
		      this.cssClass = ((String)ExpressionEvaluatorManager.evaluate("cssClass", cssClass, Object.class, this, this.pageContext));
		    }
		  }

		  public void setCssStyle(String cssStyle) throws JspException
		  {
		    this.cssStyle = cssStyle;
		    if ((cssStyle != null) && (cssStyle.startsWith("${")) && (cssStyle.endsWith("}")))
		    {
		      this.cssStyle = ((String)ExpressionEvaluatorManager.evaluate("cssStyle", cssStyle, Object.class, this, this.pageContext));
		    }
		  }

		  public void setDisabled(String disabled) throws JspException
		  {
		    this.disabled = disabled;
		    if ((disabled != null) && (disabled.startsWith("${")) && (disabled.endsWith("}")))
		    {
		      this.disabled = ((String)ExpressionEvaluatorManager.evaluate("disabled", disabled, Object.class, this, this.pageContext));
		    }
		  }

		  public void setName(String name) throws JspException
		  {
		    this.name = name;
		    if ((name != null) && (name.startsWith("${")) && (name.endsWith("}")))
		      this.name = ((String)ExpressionEvaluatorManager.evaluate("name", name, Object.class, this, this.pageContext));
		  }

		  public void setOnblur(String onblur)
		    throws JspException
		  {
		    this.onblur = onblur;
		    if ((onblur != null) && (onblur.startsWith("${")) && (onblur.endsWith("}")))
		      this.onblur = ((String)ExpressionEvaluatorManager.evaluate("onblur", onblur, Object.class, this, this.pageContext));
		  }

		  public void setOnchange(String onchange)
		    throws JspException
		  {
		    this.onchange = onchange;
		    if ((onchange != null) && (onchange.startsWith("${")) && (onchange.endsWith("}")))
		    {
		      this.onchange = ((String)ExpressionEvaluatorManager.evaluate("onchange", onchange, Object.class, this, this.pageContext));
		    }
		  }

		  public void setOnclick(String onclick) throws JspException
		  {
		    this.onclick = onclick;
		    if ((onclick != null) && (onclick.startsWith("${")) && (onclick.endsWith("}")))
		    {
		      this.onclick = ((String)ExpressionEvaluatorManager.evaluate("onclick", onclick, Object.class, this, this.pageContext));
		    }
		  }

		  public void setOndblclick(String ondblclick) throws JspException
		  {
		    this.ondblclick = ondblclick;
		    if ((ondblclick != null) && (ondblclick.startsWith("${")) && (ondblclick.endsWith("}")))
		    {
		      this.ondblclick = ((String)ExpressionEvaluatorManager.evaluate("ondblclick", ondblclick, Object.class, this, this.pageContext));
		    }
		  }

		  public void setOnfocus(String onfocus) throws JspException
		  {
		    this.onfocus = onfocus;
		    if ((onfocus != null) && (onfocus.startsWith("${")) && (onfocus.endsWith("}")))
		    {
		      this.onfocus = ((String)ExpressionEvaluatorManager.evaluate("onfocus", onfocus, Object.class, this, this.pageContext));
		    }
		  }

		  public void setOnkeydown(String onkeydown) throws JspException
		  {
		    this.onkeydown = onkeydown;
		    if ((onkeydown != null) && (onkeydown.startsWith("${")) && (onkeydown.endsWith("}")))
		    {
		      this.onkeydown = ((String)ExpressionEvaluatorManager.evaluate("onkeydown", onkeydown, Object.class, this, this.pageContext));
		    }
		  }

		  public void setOnkeypress(String onkeypress) throws JspException
		  {
		    this.onkeypress = onkeypress;
		    if ((onkeypress != null) && (onkeypress.startsWith("${")) && (onkeypress.endsWith("}")))
		    {
		      this.onkeypress = ((String)ExpressionEvaluatorManager.evaluate("onkeypress", onkeypress, Object.class, this, this.pageContext));
		    }
		  }

		  public void setOnkeyup(String onkeyup) throws JspException
		  {
		    this.onkeyup = onkeyup;
		    if ((onkeyup != null) && (onkeyup.startsWith("${")) && (onkeyup.endsWith("}")))
		    {
		      this.onkeyup = ((String)ExpressionEvaluatorManager.evaluate("onkeyup", onkeyup, Object.class, this, this.pageContext));
		    }
		  }

		  public void setOnmousedown(String onmousedown) throws JspException
		  {
		    this.onmousedown = onmousedown;
		    if ((onmousedown != null) && (onmousedown.startsWith("${")) && (onmousedown.endsWith("}")))
		    {
		      this.onmousedown = ((String)ExpressionEvaluatorManager.evaluate("onmousedown", onmousedown, Object.class, this, this.pageContext));
		    }
		  }

		  public void setOnmousemove(String onmousemove)
		    throws JspException
		  {
		    this.onmousemove = onmousemove;
		    if ((onmousemove != null) && (onmousemove.startsWith("${")) && (onmousemove.endsWith("}")))
		    {
		      this.onmousemove = ((String)ExpressionEvaluatorManager.evaluate("onmousemove", onmousemove, Object.class, this, this.pageContext));
		    }
		  }

		  public void setOnmouseout(String onmouseout)
		    throws JspException
		  {
		    this.onmouseout = onmouseout;
		    if ((onmouseout != null) && (onmouseout.startsWith("${")) && (onmouseout.endsWith("}")))
		    {
		      this.onmouseout = ((String)ExpressionEvaluatorManager.evaluate("onmouseout", onmouseout, Object.class, this, this.pageContext));
		    }
		  }

		  public void setOnmouseover(String onmouseover) throws JspException
		  {
		    this.onmouseover = onmouseover;
		    if ((onmouseover != null) && (onmouseover.startsWith("${")) && (onmouseover.endsWith("}")))
		    {
		      this.onmouseover = ((String)ExpressionEvaluatorManager.evaluate("onmouseover", onmouseover, Object.class, this, this.pageContext));
		    }
		  }

		  public void setOnmouseup(String onmouseup)
		    throws JspException
		  {
		    this.onmouseup = onmouseup;
		    if ((onmouseup != null) && (onmouseup.startsWith("${")) && (onmouseup.endsWith("}")))
		    {
		      this.onmouseup = ((String)ExpressionEvaluatorManager.evaluate("onmouseup", onmouseup, Object.class, this, this.pageContext));
		    }
		  }

		  public void setOnselect(String onselect) throws JspException
		  {
		    this.onselect = onselect;
		    if ((onselect != null) && (onselect.startsWith("${")) && (onselect.endsWith("}")))
		    {
		      this.onselect = ((String)ExpressionEvaluatorManager.evaluate("onselect", onselect, Object.class, this, this.pageContext));
		    }
		  }

		  public void setRequired(String required) throws JspException
		  {
		    this.required = required;
		    if ((required != null) && (required.startsWith("${")) && (required.endsWith("}")))
		    {
		      this.required = ((String)ExpressionEvaluatorManager.evaluate("required", required, Object.class, this, this.pageContext));
		    }
		  }

		  public void setSize(String size) throws JspException
		  {
		    this.size = size;
		    if ((size != null) && (size.startsWith("${")) && (size.endsWith("}")))
		      this.size = ((String)ExpressionEvaluatorManager.evaluate("size", size, Object.class, this, this.pageContext));
		  }

		  public void setTabindex(String tabindex)
		    throws JspException
		  {
		    this.tabindex = tabindex;
		    if ((tabindex != null) && (tabindex.startsWith("${")) && (tabindex.endsWith("}")))
		    {
		      this.tabindex = ((String)ExpressionEvaluatorManager.evaluate("tabindex", tabindex, Object.class, this, this.pageContext));
		    }
		  }

		  public void setTitle(String title) throws JspException
		  {
		    this.title = title;
		    if ((title != null) && (title.startsWith("${")) && (title.endsWith("}")))
		      this.title = ((String)ExpressionEvaluatorManager.evaluate("title", title, Object.class, this, this.pageContext));
		  }

		  public void setTooltip(String tooltip)
		    throws JspException
		  {
		    this.tooltip = tooltip;
		    if ((tooltip != null) && (tooltip.startsWith("${")) && (tooltip.endsWith("}")))
		    {
		      this.tooltip = ((String)ExpressionEvaluatorManager.evaluate("tooltip", tooltip, Object.class, this, this.pageContext));
		    }
		  }

		  public void setValue(String value) throws JspException
		  {
		    this.value = value;
		    if ((value != null) && (value.startsWith("${")) && (value.endsWith("}")))
		      this.value = ((String)ExpressionEvaluatorManager.evaluate("value", value, Object.class, this, this.pageContext));
		  }

		  public StringBuffer generateHTML()
		  {
		    StringBuffer buffer = new StringBuffer();

		    if (this.accesskey != null) {
		      buffer.append(" accesskey=\"").append(this.accesskey).append("\"");
		    }
		    if (this.cssClass != null) {
		      buffer.append(" class=\"").append(this.cssClass).append("\"");
		    }
		    if (this.cssStyle != null) {
		      buffer.append(" style=\"").append(this.cssStyle).append("\"");
		    }
		    if (this.disabled != null) {
		      buffer.append(" disabled=\"").append(this.disabled).append("\"");
		    }
		    if (this.name != null) {
		      buffer.append(" name=\"").append(this.name).append("\"");
		    }
		    if (this.onblur != null) {
		      buffer.append(" onblur=\"").append(this.onblur).append("\"");
		    }
		    if (this.onchange != null) {
		      buffer.append(" onchange=\"").append(this.onchange).append("\"");
		    }
		    if (this.onclick != null) {
		      buffer.append(" onclick=\"").append(this.onclick).append("\"");
		    }
		    if (this.ondblclick != null) {
		      buffer.append(" ondblclick=\"").append(this.ondblclick).append("\"");
		    }
		    if (this.onfocus != null) {
		      buffer.append(" onfocus=\"").append(this.onfocus).append("\"");
		    }
		    if (this.onkeydown != null) {
		      buffer.append(" onkeydown=\"").append(this.onkeydown).append("\"");
		    }
		    if (this.onkeypress != null) {
		      buffer.append(" onkeypress=\"").append(this.onkeypress).append("\"");
		    }
		    if (this.onkeyup != null) {
		      buffer.append(" onkeyup=\"").append(this.onkeyup).append("\"");
		    }
		    if (this.onmousedown != null) {
		      buffer.append(" onmousedown=\"").append(this.onmousedown).append("\"");
		    }
		    if (this.onmousemove != null) {
		      buffer.append(" onmousemove=\"").append(this.onmousemove).append("\"");
		    }
		    if (this.onmouseout != null) {
		      buffer.append(" onmouseout=\"").append(this.onmouseout).append("\"");
		    }
		    if (this.onmouseover != null) {
		      buffer.append(" onmouseover=\"").append(this.onmouseover).append("\"");
		    }
		    if (this.onmouseup != null) {
		      buffer.append(" onmouseup=\"").append(this.onmouseup).append("\"");
		    }
		    if (this.onselect != null) {
		      buffer.append(" onselect=\"").append(this.onselect).append("\"");
		    }
		    if (this.required != null) {
		      buffer.append(" required=\"").append(this.required).append("\"");
		    }
		    if (this.size != null) {
		      buffer.append(" size=\"").append(this.size).append("\"");
		    }
		    if (this.tabindex != null) {
		      buffer.append(" tabindex=\"").append(this.tabindex).append("\"");
		    }
		    if (this.title != null) {
		      buffer.append(" title=\"").append(this.title).append("\"");
		    }
		    if (this.tooltip != null) {
		      buffer.append(" tooltip=\"").append(this.tooltip).append("\"");
		    }

		    return buffer;
		  }

		  public void clearValue()
		  {
		    this.accesskey = null;
		    this.cssClass = null;
		    this.cssStyle = null;
		    this.disabled = null;
		    this.name = null;
		    this.onblur = null;
		    this.onchange = null;
		    this.onclick = null;
		    this.ondblclick = null;
		    this.onfocus = null;
		    this.onkeydown = null;
		    this.onkeypress = null;
		    this.onkeyup = null;
		    this.onmousedown = null;
		    this.onmousemove = null;
		    this.onmouseout = null;
		    this.onmouseover = null;
		    this.onmouseup = null;
		    this.onselect = null;
		    this.required = null;
		    this.size = null;
		    this.tabindex = null;
		    this.title = null;
		    this.tooltip = null;
		    this.value = null;
		    this.id = null;
		  }
}
