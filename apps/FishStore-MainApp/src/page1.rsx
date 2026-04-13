<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
  uuid="3ba98a3c-2cfc-453b-a246-e1f97dc2c995"
>
  <State
    id="selectedFish"
    value="{{ (formatDataAsArray(queryFishView.data) || [])[0] || {} }}"
  />
  <JavascriptQuery
    id="jsHandleFishClick"
    notificationDuration={4.5}
    query={include("../lib/jsHandleFishClick.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="cartItems" value="{{ [] }}" />
  <JavascriptQuery
    id="jsAddToCart"
    notificationDuration={4.5}
    query={include("../lib/jsAddToCart.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="jsRemoveFromCart"
    notificationDuration={4.5}
    query={include("../lib/jsRemoveFromCart.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <WorkflowRun
    id="submitOrder"
    isMultiplayerEdited={false}
    resourceName="WorkflowRun"
    resourceTypeOverride=""
    workflowId="a0cb6b6d-903e-44c3-80ca-5ff72411dc2e"
    workflowParams={include("../lib/submitOrder.json", "string")}
  />
  <JavascriptQuery
    id="jsSubmitOrder"
    notificationDuration={4.5}
    query={include("../lib/jsSubmitOrder.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="jsReduceInventory"
    notificationDuration={4.5}
    query={include("../lib/jsReduceInventory.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <State id="currentFishId" value="{{ null }}" />
  <State id="currentQuantityToReduce" value="{{ null }}" />
  <SqlQueryUnified
    id="reduceOneFishQuantity"
    query={include("../lib/reduceOneFishQuantity.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="3b39cc6e-d82d-48d8-818f-5433148daed9"
    runWhenModelUpdates={false}
    warningCodes={[]}
  />
  <Include src="./modalFishDetails.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <Container
      id="containerFishMenu"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
      style={{ map: { background: "surfaceSecondary" } }}
    >
      <Header>
        <Text
          id="containerFish"
          horizontalAlign="center"
          value="#### Fish for Sale"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <ImageGrid
          id="imageGridFish"
          aspectRatio={1}
          captionByIndex="{{ queryFishView.data.common_name[i] }}"
          columnCount="6"
          columnMinWidth={100}
          data="{{ queryFishView.data }}"
          srcByIndex="{{ queryFishView.data.image[i] }}"
        >
          <Event
            id="4880c565"
            event="click"
            method="run"
            params={{
              map: {
                src: "const data = queryFishView.data || {}; const clickedFish = { id: data.id?.[i], common_name: data.common_name?.[i], scientific_name: data.scientific_name?.[i], image: data.image?.[i], quantity: data.quantity?.[i], diet: data.diet?.[i], temperament: data.temperament?.[i], min_tank_gallons: data.min_tank_gallons?.[i], care_notes: data.care_notes?.[i] }; selectedFish.setValue(clickedFish); numberInputQuantity.setValue(1); modalFishDetails.setHidden(false);",
              },
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </ImageGrid>
      </View>
    </Container>
    <Button
      id="buttonSendOrder"
      disabled="{{ (cartItems.value || []).length === 0 }}"
      loading="{{  jsAddToCart.isFetching }}"
      style={{
        borderRadius: "18px",
        background: "rgba(255, 132, 0, 1)",
        activeBackground: "success",
        label: "rgba(255, 255, 255, 1)",
      }}
      text="ORDER"
    >
      <Event
        id="419b9261"
        event="click"
        method="trigger"
        params={{}}
        pluginId="jsRemoveFromCart"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="7002ad1f"
        event="click"
        method="run"
        params={{ map: { src: "jsSubmitOrder.trigger()" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Container
      id="containerCart"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
      style={{
        border: "surfacePrimaryBorder",
        borderRadius: "8px",
        background: "surfaceSecondary",
      }}
    >
      <Header>
        <Text
          id="textCartTitle"
          horizontalAlign="center"
          value="#### Cart"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Table
          id="tableCart"
          actionsOverflowPosition={1}
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ cartItems.value }}"
          defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          primaryKeyColumnId="4ad84"
          showFooter={true}
          showHeader={true}
          style={{
            rowSeparator: "rgb(226, 232, 240)",
            headerBackground: "rgba(255, 132, 0, 0.14)",
            background: "rgba(255, 132, 0, 0)",
          }}
          toolbarPosition="bottom"
        >
          <Column
            id="4ad84"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="true"
            key="id"
            label="ID"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="91e15"
            alignment="center"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="common_name"
            label="Fish"
            placeholder="Enter value"
            position="center"
            size={200}
            summaryAggregationMode="none"
          />
          <Column
            id="ec24e"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="scientific_name"
            label="Scientific name"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="bd978"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="true"
            key="min_tank_gallons"
            label="Min tank gallons"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="95d77"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="diet"
            label="Diet"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="ac4b8"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="temperament"
            label="Temperament"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="00933"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="care_notes"
            label="Care notes"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="db943"
            alignment="center"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="quantity"
            label="Quantity"
            placeholder="Enter value"
            position="center"
            size={503}
            summaryAggregationMode="none"
          />
          <Column
            id="d2548"
            alignment="left"
            format="link"
            formatOptions={{ showUnderline: "hover" }}
            groupAggregationMode="none"
            hidden="true"
            key="image"
            label="Image"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Action id="2b335" icon="line/interface-delete-bin-1" label="Remove">
            <Event
              id="6b4c8892"
              event="clickAction"
              method="run"
              params={{ map: { src: "jsRemoveFromCart.trigger()" } }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
          </Action>
        </Table>
      </View>
    </Container>
  </Frame>
</Screen>
