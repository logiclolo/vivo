// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree .

var strcodec;
var ntable=3;
var restablewidth = [241, 311, 381, 451, 521, 591]; // magic numbers
var defaulttablewidth = [241, 381, 521, 661, 801, 941]; // magic numbers
var first_click_video_tab = true;

jQuery(function() {
  jQuery( "#tabs" ).tabs();
});


/* table scroll */

function initVideoModeTable(mode)
{
    // compose jquery selector strings
    var res_tablescroll_body = "#res_tablescroll_body" + mode;
    var table_resolution = "#table_resolution" + mode;
  
  	// Init "add preset location"
    $('label.pre').labelOver('overlay').show();

    // Preset - Select All or Clear
    $("#chk_SelAllPreset").click(function() {
        $(this).attr("checked") ? $(table_resolution + " :checkbox").attr("checked", true) : $(table_resolution + " :checkbox").attr("checked", false);
    });

    // Patrol - Select All or Clear
    $("#chk_SelAllPatrol").click(function() {
        $(this).attr("checked") ? $(res_tablescroll_body + " :checkbox").attr("checked", true) : $(res_tablescroll_body + " :checkbox").attr("checked", false);
    });

    // Generate Preset table
    var presetItemStr = "";
    /*
    for (i = 0; i < MAX_PRESET_COUNT; i ++)
    {
      //var presetName = eval("camctrl_c0_preset_i" + i + "_name");
		
		  //add by ken, for eptz
		  var presetName = eval("eptz_c0_s" + streamsource + "_preset_i" + i + "_name");
		  if (presetName != "")
      {
        presetItemStr += "<tr><td><input type='checkbox'/></td><td style='cursor: default;' title='" + presetName + "'>" + presetName + "</td></tr>";
      }
    }
    */
    $(table_resolution + " tbody").append(presetItemStr);
    
    //Avoid draggin operation on this field.
    $(table_resolution + " td:odd").live("mousedown", function(){
        return false;
    });

    // Generate Patrol table
    var patrolItemStr = "";
	
	  //add by ken, for eptz
	  /*
	  var tmpPatrol = eval("eptz_c0_s"+ streamsource +"_patrolseq").split(',');
	  var tmpDwelling = eval("eptz_c0_s"+ streamsource +"_patroldwelling").split(','); 
	
    if (tmpPatrol != "")
    {
        for (i = 0; i < tmpPatrol.length; i ++)
        {
			var patrolName = eval("eptz_c0_s"+ streamsource +"_preset_i"+tmpPatrol[i]+"_name");
			var patrolDwell = tmpDwelling[i];
			
			patrolItemStr += "<tr><td><input type='checkbox'/></td><td title='"+ patrolName +"'>" + patrolName + "</td><td><input type='text' style='width:70px;' value='" + patrolDwell + "' maxlength='3'/></td></tr>";
        }
		
		$("#res_tablescroll_body tbody").append(patrolItemStr);
    }
    */

    // Make Patrol locations Drag & Drop
    //$("#res_tablescroll_body").tableDnD({ onDragClass: "myDragClass" });
    //if (bIsWinMSIE) $("#res_tablescroll_body :checkbox").css("cursor", "default");

    $(res_tablescroll_body + " tr").live('click', function(){
        $(this).siblings().attr("selected", 0).css("background", "#fff");
        $(this).attr("selected", 1).css("background", "#ccc");
    });

    // Finetune Patrol dwell time layout
    $(res_tablescroll_body + " :text").css("padding", "0 3px");
}

function newResolution(mode)
{
  $("#res_tablescroll_new"+mode).show();
}

function addResolution(mode)
{
  // compose jquery selector strings
  var table_resolution = "#table_resolution" + mode;
  
  $(table_resolution + " tbody").append("<tr><td><input type='checkbox'/></td><td style='cursor: default;' title='" + $("#new_resolution_input"+mode).val()+ "'>" + $("#new_resolution_input"+mode).val() + "</td></tr>");
}

function pushResolution(mode)
{
  // compose jquery selector strings
  var res_tablescroll_body = "#res_tablescroll_body" + mode;
  var table_resolution = "#table_resolution" + mode;
  
  var res_str = "";
  var res_num = $(res_tablescroll_body + " tbody").children().length;
  $(table_resolution + " :checked").each(function(i, obj){
    
    var res = $(obj).parent().siblings().attr("title");
    res_str += "<tr><td><input type='checkbox'/></td>"+
              "<td>" + res + "<input type='text' name='userinput[videoin_c0"+mode+"_resolution_"+res_num+"]' value='"+res+"' style='display:none'></td></td>" +
              "<td style='text-align:left'><input name='userinput[videoin_c0"+mode+"_maxframerate_"+res_num+"]' style='padding: 0 3px; width: 50px;' type='text' value='30'/></td>";
   
    var codec_name = strcodec.split(',') ;
    for (i = 0; i < ncodec; i ++)
    {
      res_str += "<td class='" + codec_name[i] + "' style='text-align:left'><input name='userinput[videoin_c0"+mode+"_maxfps_"+codec_name[i]+"_"+res_num+"]'style='padding: 0 3px; width: 50px;' type='text' value='30'/></td>";
    }
    res_str += "</tr>";
    res_num = res_num + 1;
    
  });
  
  $(res_tablescroll_body + " tbody").append(res_str);
  
  //calculate total resolutions
  $("#userinput_videoin_c0"+mode+"_nresolution").val($(res_tablescroll_body + " tbody").children().length);
  
  //Make new item Drag & Drop
  //$("#res_tablescroll_body").tableDnD({ onDragClass: "myDragClass" });
  //if (bIsWinMSIE) $("#res_tablescroll_body :checkbox").css("cursor", "default");


}

function popResolution(mode)
{
  // compose jquery selector strings
  var res_tablescroll_body = "#res_tablescroll_body" + mode;
  
  $(res_tablescroll_body + " :checked").parent().parent().remove();
  
    //calculate total resolutions
  $("#userinput_videoin_c0"+mode+"_nresolution").val($(res_tablescroll_body + " tbody").children().length);
}

function MoveUp(mode)
{
  // compose jquery selector strings
  var res_tablescroll_body = "#res_tablescroll_body" + mode;
  
  var Index = $(res_tablescroll_body + " tr").index($(res_tablescroll_body + " tr[selected='1']"));
  if ( -1 == Index) return;

  if ( Index == $(res_tablescroll_body + " tr").index($(res_tablescroll_body + " tr:first")) ) return;  // At first place
    $(res_tablescroll_body + " tr[selected='1']").insertBefore($(res_tablescroll_body + " tr:eq("+ (Index-1) +")"));
}

function MoveDown(mode)
{
  // compose jquery selector strings
  var res_tablescroll_body = "#res_tablescroll_body" + mode;
  
  var Index = $(res_tablescroll_body + " tr").index($(res_tablescroll_body + " tr[selected='1']"));
  if ( -1 == Index ) return;

  if ( Index == $(res_tablescroll_body + " tr").index($(res_tablescroll_body + " tr:last")) ) return;  // At last place
  $(res_tablescroll_body + " tr[selected='1']").insertAfter($(res_tablescroll_body + " tr:eq("+ (Index + 1) +")"));
}

function addTableColumn(obj, mode, width, width2)
{
  var add = $(obj).attr('id');
  var name;
  
  if (add =="userinput_h265")
  {
    name = "h265";
  }
  else if (add == "userinput_h264")
  {
    name = "h264";
  }
  else if (add == "userinput_mjpeg")
  {
    name = "mjpeg";
  }
  
  /******* Resolutions & MaxFPS table ********/
  //adjust table width
  $("#res_tablescroll_head"+mode).css("width",width);
  $("#res_div_body"+mode).css("width",width);
  $("#res_tablescroll_body"+mode).css("width",width);
  $("#res_tablescroll_foot"+mode).css("width",width);
  $("#colgroup"+mode).append("<col class='"+name+"' width='70'/>");
  
  //add table column title
  $("#tablescroll_tr"+mode).append("<th class='"+name+"'  style='width: 70px;text-align:left'><span title='symbol'>Max FPS (" + name + ")</span></th>");
  
  //add table content
  var count = 0;
  if($("#tbody"+mode).children().length != 0)
  {
    $("#tbody"+mode).find('tr').each(function(){
      // check whether to add table content or not
      // 3 means "check box" and "resolution input" and "MaxFPS"
      if($(this).find('td').length != (ncodec + 3))
      {
        // add "Codec MaxFPS" table content
        $(this).append("<td class='" + name + "' style='text-align:left'><input name='userinput[videoin_c0"+mode+"_maxfps_"+name+"_"+count+"]' style='padding: 0 3px; width: 50px;' type='text' value='30'/></td>");
      }
      count++;
    })
  }
  
  /******** Default bitrate & framerate table ***********/
  //adjust table width
  $("#default_tablescroll_head"+mode).css("width",width2);
  $("#default_div_body"+mode).css("width",width2);
  $("#default_tablescroll_body"+mode).css("width",width2);
  $("#default_tablescroll_foot"+mode).css("width",width2);
  $("#default_colgroup"+mode).append("<col class='"+name+"' width='70'/>");
  $("#default_colgroup"+mode).append("<col class='"+name+"' width='70'/>");
  
  //add table colunm title
  $("#default_tablescroll_tr"+mode).append("<th class='"+name+"'  style='width: 70px;text-align:left'><span title='symbol'>Framerate (" + name + ")</span></th>" +
                                            "<th class='"+name+"'  style='width: 70px;text-align:left'><span title='symbol'>Bitrate (" + name + ")</span></th>");
  //add table content                                          
  var stream = 0;
  if($("#default_tbody"+mode).children().length != 0)
  {
    $("#default_tbody"+mode).find('tr').each(function(){
      // check whether to add table content or not
      // 2 means "check box" and "stream" 
      if($(this).find('td').length != (ncodec*2 + 2))
      {
        $(this).append("<td class='" + name + "' style='text-align:left'><input name='userinput[videoin_c0"+mode+"_defaultsetting_s"+stream+"_"+name+"_framerate]' style='padding: 0 3px; width: 50px;' type='text' value='30'/></td>" +
                      "<td class='" + name + "' style='text-align:left'><input name='userinput[videoin_c0"+mode+"_defaultsetting_s"+stream+"_"+name+"_bitrate]' style='padding: 0 3px; width: 50px;' type='text' value='30'/></td>")
      }
      stream++;
    })
  }
  
  
}

function removeTableColumn(obj, mode, width, width2)
{
  var remove = $(obj).attr('id');
  var name;
  
  if (remove =="userinput_h265")
  {
   name = "h265";
  }
  else if (remove == "userinput_h264")
  {
    name = "h264";
  }
  else if (remove == "userinput_mjpeg")
  {
    name = "mjpeg";
  }
  
  $("#tbody"+mode+" tr").each(function() {
   $(this).find("td."+name).remove();
  });
  
  $("#default_tbody"+mode+" tr").each(function() {
   $(this).find("td."+name).remove();
  });
  
  /* Resolutions & MaxFPS table*/
  $("#res_tablescroll_head"+mode).css("width",width);
  $("#res_div_body"+mode).css("width",width);
  $("#res_tablescroll_body"+mode).css("width",width);
  $("#res_tablescroll_foot"+mode).css("width",width);
  $("#colgroup"+mode).find("col."+name).remove();
  $("#tablescroll_tr"+mode).find("th."+name).remove();
  
  /* Default bitrate and framerate table*/
  $("#default_tablescroll_head"+mode).css("width",width2);
  $("#default_div_body"+mode).css("width",width2);
  $("#default_tablescroll_body"+mode).css("width",width2);
  $("#default_tablescroll_foot"+mode).css("width",width2);
  $("#default_colgroup"+mode).find("col."+name).remove();
  $("#default_tablescroll_tr"+mode).find("th."+name).remove();
}


function calCodec()
{
  ncodec = 0;
  strcodec = "";
  
  prepareTable();
  
  // get the total codec first!
  $(".codec").each(function (){
    if($(this).is(":checked")){
      ncodec++;
    }
  })
  
  $(".codec").each(function (){
    if($(this).is(":checked"))
    {

      strcodec += $(this).attr('id').replace("userinput_","") + ',';//add codec string
      
      for (var i=0;i<ntable;i++)
      {
        var mode = "_mode" + i;
        addTableColumn(this, mode, restablewidth[ncodec], defaulttablewidth[ncodec]);
      }
      
    }
  
  })
}

function prepareTable()
{
  // initial all tables
  for (var i=0;i<ntable;i++)
  {
    var mode = "_mode" + i;
    initVideoModeTable(mode);
  }
  
  // only show nvideomode tables
  for (i=0;i<userinput_nvideomode;i++)
  {
    $("#div_videomode"+i).show();
  }
}

function loadcurrentsetting()
{
  // eval important parameters
  $(".params").each(function(){
    var value = $(this).val();
    var id = $(this).attr('id');
    eval(id + "=" + value);
  })
}

/***********Make sure HTML code is completely loaded *********/
/****************** All start from here! *******************/
$(document).ready(function(){
 
    loadcurrentsetting();
    
    // tab event handler
    $("#tabs" ).tabs({                                                                  
      activate:function(event,ui){                                                       
        var active = $('#tabs').tabs('option', 'active');
        
        // #tab video
        if (active == 2)  
        {
          if(first_click_video_tab)// first click
          {
            first_click_video_tab = false;
            calCodec();
          }
        }
 
      }                                                                          
    }); 
    
    // when changing params content ...
    // note: unbind() is to make sure not be bound twice
    $(".params").unbind('change').change( function(){
      //console.log(event.target);
      var value = $(this).val();
      var id = $(this).attr('id');
      eval(id + "=" + value);
      
      //video mode number
      if (id == "userinput_nvideomode")
      {
          for (i=0;i<ntable;i++)
          {
            $("#div_videomode"+i).hide();
          }
          
          for (i=0;i<userinput_nvideomode;i++)
          {
            $("#div_videomode"+i).show();
          }
      }
      
      //stream number
      if (id == "userinput_nmediastream")
      {
        if (first_click_video_tab != true)
        {
          for (i=0;i<userinput_nvideomode;i++)
          {
            $("#default_tbody_mode"+i).find('tr').each(function(){
              var stream_num = $(this).attr('id').substr($(this).attr('id').length - 1);
              stream_num = parseInt(stream_num) + 1;
            
              if (stream_num > userinput_nmediastream)
              {
                $(this).remove();
              }
            
            })
          }
        }
      }
    });
    

    
  
    // when clicks video codec ...
    // note: unbind() is to make sure not be bound twice
    $(".codec").unbind('click').bind( "click", function() {
      //console.log(event.target);
      
      //console.log($(this).attr('id'));
      if($(this).is(":checked"))
      {
        ncodec = ncodec + 1;
        strcodec += $(this).attr('id').replace("userinput_","") + ','; //add codec strings
        for (i=0;i<ntable;i++)
        {
          var mode = "_mode" + i;
          addTableColumn(this, mode, restablewidth[ncodec], defaulttablewidth[ncodec]);
        }
      }
      else
      {
        ncodec = ncodec - 1;
        strcodec = strcodec.replace($(this).attr('id').replace("userinput_","")+",", ""); //remove codec strings
        for (i=0;i<ntable;i++)
        {
          var mode = "_mode" + i;
          removeTableColumn(this, mode, restablewidth[ncodec], defaulttablewidth[ncodec]);
        }
      }
    });
   
 

    // flickerless show or not
    if ($("#userinput_image_c0_iris_type_fixed").is(":checked"))
    {
        $("#flickerless_div").show();
    }
    $('#userinput_image_c0_iris_type_fixed').unbind('click').click(
      function(){
        $("#flickerless_div").slideDown();
        $("#userinput_image_c0_flickerless_1").attr("checked",true);
        //$("#flickerless_div").css("background-color","yellow");
    })
    $('#userinput_image_c0_iris_type_dc').unbind('click').click(
      function(){
        $("#flickerless_div").slideUp();
        $("#userinput_image_c0_flickerless_0").attr("checked",true);
        
    })
    $('#userinput_image_c0_iris_type_p').unbind('click').click(
      function(){
        $("#flickerless_div").slideUp();
        $("#userinput_image_c0_flickerless_0").attr("checked",true);
    })
    
    
    // wdr pro strength show or not
    if ($("#userinput_image_c0_wdrpro_1").is(":checked"))
    {
        $("#wdrpro_div").show();
    }
    $('#userinput_image_c0_wdrpro_1').unbind('click').click(
      function(){
        $("#wdrpro_div").slideDown();
        $("#userinput_image_c0_wdrpro_str_1").attr("checked",true);
        //$("#wdrpro_div").css("background-color","yellow");
    })
    $('#userinput_image_c0_wdrpro_0').unbind('click').click(
      function(){
        $("#wdrpro_div").slideUp();
        $("#userinput_image_c0_wdrpro_str_0").attr("checked",true);
        
    })

    
    
})

jQuery.fn.labelOver = function(overClass) {
    return this.each(function(){
        var label = jQuery(this);
        var f = label.attr('for');
        if (f) {
            var input = jQuery('#' + f);
            
            this.hide = function() {
                label.css({ textIndent: -10000 });
				if (document.spdfm.presetLocs.length > MAX_PRESET_COUNT)
				{
					$(this).nextAll(":button").attr("disabled","true");
				}
				else
				{
					$(this).nextAll(":button").removeAttr("disabled");
				}
                $(this).nextAll(":button").css("visibility", "visible");
            };
            
            this.show = function() {
                if (input.val() == '') {
                    label.css({ textIndent: 0 });
                    $(this).nextAll(":button").css("visibility", "hidden");
                } 
            };

            // handlers
            input.focus(this.hide);
            input.blur(this.show);
            label.addClass(overClass).click(function(){ input.focus(); });
            
            if (input.val() != '') this.hide(); 
        }
    });
};