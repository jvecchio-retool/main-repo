<Screen
  id="page2"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={1}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="65413f46-b54a-4499-b1cd-8feb92af393f"
>
  <Function
    id="transformOrderContents"
    funcBody={include("../lib/transformOrderContents.js", "string")}
  />
  <Function
    id="transformedOrdersData"
    funcBody={include("../lib/transformedOrdersData.js", "string")}
  />
  <Frame
    id="$main2"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Container
      id="tabbedContainer1"
      currentViewKey="{{ self.viewKeys[0] }}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
      style={{ map: { background: "surfaceSecondary" } }}
    >
      <Header>
        <Tabs
          id="tabs1"
          itemMode="static"
          navigateContainer={true}
          targetContainerId="tabbedContainer1"
          value="{{ self.values[0] }}"
        >
          <Option id="00030" value="Tab 1" />
          <Option id="00031" value="Tab 2" />
          <Option id="00032" value="Tab 3" />
        </Tabs>
      </Header>
      <View id="00030" viewKey="New Orders">
        <Table
          id="tableNewOrders"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ transformedOrdersData.value }}"
          defaultFilters={{
            0: {
              id: "b5bcc",
              columnId: "f9a8a",
              operator: "is",
              value: '"false"',
              disabled: false,
            },
          }}
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          primaryKeyColumnId="de0cd"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          style={{ background: "canvas" }}
          toolbarPosition="bottom"
        >
          <Column
            id="de0cd"
            alignment="right"
            editable={false}
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="order_number"
            label="Order number"
            placeholder="Enter value"
            position="center"
            size={107.515625}
            summaryAggregationMode="none"
          />
          <Column
            id="7d714"
            alignment="left"
            cellTooltipMode="overflow"
            editableOptions={{ spellCheck: false }}
            format="multilineString"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="order_contents"
            label="Order contents"
            placeholder="Enter value"
            position="center"
            size={759.078125}
            summaryAggregationMode="none"
          />
          <Column
            id="0310d"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="tracking_number"
            label="Tracking number"
            placeholder="Enter value"
            position="center"
            size={272.40625}
            summaryAggregationMode="none"
          />
          <Column
            id="f9a8a"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="false"
            key="delivered"
            label="Shipped"
            placeholder="Select option"
            position="center"
            size={96.15625}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="c42e1"
            alignment="left"
            format="link"
            formatOptions={{ showUnderline: "hover" }}
            groupAggregationMode="none"
            hidden="true"
            key="customer_email"
            label="Customer email"
            position="center"
            size={230.34375}
            summaryAggregationMode="none"
          >
            <Event
              id="0b294a08"
              event="clickCell"
              method="openUrl"
              params={{ map: { url: "mailto:{{ item }}" } }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="49749"
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
            id="475d2"
            alignment="left"
            cellTooltipMode="overflow"
            format="tags"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="order_contents_raw"
            label="Order contents raw"
            placeholder="Select options"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <ToolbarButton
            id="4d"
            icon="bold/interface-arrows-round-left"
            label="Refresh"
            type="custom"
          >
            <Event
              id="efc11c9e"
              event="clickToolbar"
              method="refresh"
              pluginId="tableNewOrders"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
      <View id="00031" viewKey="Completed Orders">
        <Table
          id="tableDelivered"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ transformedOrdersData.value }}"
          defaultFilters={{
            0: {
              id: "0ff33",
              columnId: "d5521",
              operator: "is",
              value: '"True"',
              disabled: false,
            },
          }}
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          primaryKeyColumnId="e841c"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          style={{ background: "canvas" }}
          toolbarPosition="bottom"
        >
          <Column
            id="74c44"
            alignment="right"
            editable={false}
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="true"
            key="id"
            label="ID"
            placeholder="Enter value"
            position="center"
            size={33.6875}
            summaryAggregationMode="none"
          />
          <Column
            id="e841c"
            alignment="right"
            editable={false}
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="order_number"
            label="Order number"
            placeholder="Enter value"
            position="center"
            size={118}
            summaryAggregationMode="none"
          />
          <Column
            id="68500"
            alignment="left"
            cellTooltipMode="overflow"
            format="multilineString"
            groupAggregationMode="none"
            key="order_contents"
            label="Order contents"
            placeholder="Enter value"
            position="center"
            size={680}
            summaryAggregationMode="none"
          />
          <Column
            id="f8df9"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="tracking_number"
            label="Tracking number"
            placeholder="Enter value"
            position="center"
            size={315}
            summaryAggregationMode="none"
          />
          <Column
            id="d5521"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="delivered"
            label="Shipped"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="af230"
            alignment="left"
            format="link"
            formatOptions={{ showUnderline: "hover" }}
            groupAggregationMode="none"
            hidden="true"
            key="customer_email"
            label="Customer email"
            position="center"
            size={100}
            summaryAggregationMode="none"
          >
            <Event
              id="5319393e"
              event="clickCell"
              method="openUrl"
              params={{ map: { url: "mailto:{{ item }}" } }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="f6227"
            alignment="left"
            cellTooltipMode="overflow"
            format="tags"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="order_contents_raw"
            label="Order contents raw"
            placeholder="Select options"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <ToolbarButton
            id="4d"
            icon="bold/interface-arrows-round-left"
            label="Refresh"
            type="custom"
          >
            <Event
              id="93e7766e"
              event="clickToolbar"
              method="refresh"
              pluginId="tableDelivered"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
  </Frame>
</Screen>
