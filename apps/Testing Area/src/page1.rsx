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
  <Include src="./modalFrame1.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <NumberInput
      id="numberInput1"
      currency="USD"
      decimalPlaces="9"
      inputValue={0}
      labelPosition="top"
      placeholder="Enter value"
      showSeparators={true}
      showStepper={true}
      value="9.999999999"
    />
    <Button id="button2" text="Button">
      <Event
        id="d2cdcee5"
        event="click"
        method="openApp"
        params={{
          uuid: "91ba7906-c4d7-11f0-a1f1-bf9ef5647de4",
          options: { pageName: "page1", newTab: true },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Select
      id="select1"
      captionByIndex="{{ item.email }}"
      colorByIndex=""
      data="{{ queryAllUsers.data }}"
      disabledByIndex="{{ !item.two_factor_auth_enabled }}"
      emptyMessage="No options"
      fallbackTextByIndex=""
      hiddenByIndex=""
      iconByIndex=""
      imageByIndex=""
      label="All Users"
      labelPosition="top"
      labels="{{ `${item.first_name} ${item.last_name}` }}"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      tooltipByIndex=""
      values="{{ item.id }}"
    />
    <StripeCardForm
      id="stripeCardForm1"
      stripePublishableKey="pk_test_replace_me"
      submitButtonText="Submit"
    />
  </Frame>
</Screen>
