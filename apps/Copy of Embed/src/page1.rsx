<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
  uuid="e51acaa1-141e-41a1-8d41-626b238c1616"
>
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    paddingType="normal"
    sticky={null}
    type="main"
  >
    <CustomComponent
      id="customComponent1"
      allowSameOrigin={true}
      iframeCode={
        '<html>\n  <head>\n    <script src="https://cdn.tryretool.com/embed.js"> </script>\n  </head>\n  <body>\n    <div style="height: 800px; width: 100%;" id="container"></div>\n    <script>\n      var rt =\n      window.retool.RetoolDashboard(document.getElementById(\'container\'),\n      \'https://retoolin.tryretool.com/apps/Christian%20P/APP%20TO%20EMBED\')\n    </script>\n    \n    <script>\n\n      let retoolContainer = document.getElementById("container")\n      retoolContainer.style.border=" 4px solid red"\n\n      \n      function parentUpdateText() {\n        document.getElementById("from-parent").innerHTML = "Hello From the Parent App";\n        // window.parent.postMessage("Hello From this iFrame", "*");\n        // let retoolContainer = document.getElementById("container");\n        // let frame = retoolContainer.children[0];\n        // console.log(frame);\n        // frame.contentWindow.postMessage("Hello From the iFrame", "*");\n      }\n\n      window.addEventListener(\n        "message",\n        function(e) {\n\n          if(e.origin === "https://retoolin.tryretool.com"){\n\n            let parentAppOutput = document.getElementById("row-selected");\n            console.log("Parent Window Recieved this from the Embedded App: ", e.data);\n            e.data.name != undefined ? (parentAppOutput.innerHTML = e.data.name + " <--------- This value is coming from the Embedded App to the Parent App") : ""\n   \n          }\n        }, false,\n      )\n\n      \n    </script>\n    \n    <h2 id="row-selected" style="color: purple"></h2>\n    <button id="button-value" onClick="parentUpdateText()">Click to send Message to the Retool App</button>\n    \n    <div id="from-parent">This is a Text Component Populated by the Parent App</div>\n  </body>\n</html>'
      }
      model={
        '{\n  "displayText": "Clicking the \\"Update model\\" button below will update the model and change this text.",\n  "queryToTrigger": "query1"\n}'
      }
    />
  </Frame>
</Screen>
