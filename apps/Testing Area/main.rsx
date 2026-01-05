<App>
  <Include src="./functions.rsx" />
  <Include src="./src/page1.rsx" />
  <AppStyles id="$appStyles" css={include("./lib/$appStyles.css", "string")} />
  <Include src="./src/page2.rsx" />
</App>
