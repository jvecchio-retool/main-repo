<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={1}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
  uuid="98231e24-f0a4-4fe8-9164-59b5d9a9d782"
>
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <Text
      id="text1"
      value="👋 **Hello {{ current_user.firstName || 'friend' }}!**"
      verticalAlign="center"
    />
    <Button id="button1" text="Button" />
    <Table
      id="table1"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ queryDB.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="cf0af"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="cf0af"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="id"
        label="ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="60625"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="order_number"
        label="Order number"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="8169e"
        alignment="left"
        cellTooltipMode="overflow"
        format="tags"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="order_contents"
        label="Order contents"
        placeholder="Select options"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="41e3e"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="tracking_number"
        label="Tracking number"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="5f08a"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="true"
        key="delivered"
        label="Delivered"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="53322"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="customer_email"
        label="Customer email"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="4f637"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="ship_noti"
        label="Ship noti"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          id="8eddc13b"
          event="clickToolbar"
          method="exportData"
          pluginId="table1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          id="7fd1adc9"
          event="clickToolbar"
          method="refresh"
          pluginId="table1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </Frame>
</Screen>
