module JavaScriptHelper
  
  SCRIPT_BEGIN = %{<script type="text/javascript" charset="utf-8">}
  SCRIPT_END = %{</script>}
  
  def js_focus_on_element(element)
    %{#{SCRIPT_BEGIN}window.onload = function() {document.getElementById('#{element}').focus();}#{SCRIPT_END}}
  end
  
  
  def js_button_toggle_id_element(name ,id)
    button_to_function name do |page|
      #page.toggle id
      
      #page.visual_effect(:toggle_blind, 'search_people')
      page.visual_effect(:toggle_appear, 'search_people')
      #page.visual_effect(:toggle_slide, 'search_people')
      # schaltet nur aus.  page.visual_effect(:fade, 'search_people')
      #page.visual_effect(:highlight, "search_people", :duration => 1.5)
    end
  end
  
  def js_hide_id_element(id)
    javascript_tag do
      update_page do |page|
        page.hide id
      end
    end 
  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  def js_change_id_with_partial
    
    #$("#people").html("<%= escape_javascript(render("people")) %>");
    
    # Funktioniert nicht...so wie oben muss es sein???
    %{$("#people").html("<%= escape_javascript(render("people")) %>");}
  end
  
  def js_render_partial_pagination(text = "Page is loading...")
    
    %{#{SCRIPT_BEGIN}
      jQuery(function() {
        jQuery(".pagination a").live("click", function() {
          jQuery.setFragment({ "page" : jQuery.queryString(this.href).page });
          jQuery(".pagination").html("#{text}<img src='/images/spinner.gif' alt=#{text}>");
          jQuery.getScript(this.href);
          return false;
        });

      	jQuery.fragmentChange(true);
      	jQuery(document).bind("fragmentChange.page", function() {
      	  jQuery.getScript(jQuery.queryString(document.location.href, { "page" : jQuery.fragment().page }));
      	});

      	if (jQuery.fragment().page) {
      		jQuery(document).trigger("fragmentChange.page");
      	}    
    	});
    #{SCRIPT_END}}
  end
  
  def js_render_partial_search(text = "Page is loading...")
    %{#{SCRIPT_BEGIN}
      jQuery.fn.submitWithAjax = function() {
        this.submit(function() {
          jQuery(".pagination").html("#{text}<img src='/images/spinner.gif' alt=#{text}>...gefiltert");
          jQuery.get(this.href, jQuery(this).serialize() + '&page=1', null, "script");
          return false;
        })
        return this;
      };
      jQuery(document).ready(function() {
        jQuery("#new_search").submitWithAjax();
      })
    #{SCRIPT_END}}
  end
  
  
  
  
  
  def js_submit_button(id)
    %{#{SCRIPT_BEGIN}
      $(document).ready(function() {
        $("#new_review").submitWithAjax();
      })
    #{SCRIPT_END}}
  end
  
  def js_submit
    %{#{SCRIPT_BEGIN}
      jQuery.fn.submitWithAjax = function() {
        this.submit(function() {
          $.post(this.action, $(this).serialize(), null, "script");
          return false;
        })
        return this;
      };
    #{SCRIPT_END}}
  end
end