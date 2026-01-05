<GlobalFunctions>
  <JavascriptQuery
    id="queryJS"
    notificationDuration={4.5}
    query={include("./lib/queryJS.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <SqlQueryUnified
    id="queryDB"
    query={include("./lib/queryDB.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="3b39cc6e-d82d-48d8-818f-5433148daed9"
    warningCodes={[]}
  />
  <RESTQuery
    id="queryREST"
    query="any"
    resourceDisplayName="httpbun.com"
    resourceName="3721d007-357f-41d7-a36a-72cf9bb2dbf6"
    resourceTypeOverride=""
  />
</GlobalFunctions>
