<ModalFrame
  id="modalFishDetails"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showOverlay={true}
  size="medium"
  style={{ map: { background: "rgba(255, 217, 177, 1)" } }}
>
  <Body>
    <Image
      id="imageFishDetail"
      horizontalAlign="center"
      src="{{ selectedFish.value.image }}"
      style={{}}
    />
    <KeyValue
      id="keyValueFishInfo"
      data={
        '{{ { "Common name": selectedFish.value.common_name, "Scientific name": selectedFish.value.scientific_name, "In stock": selectedFish.value.quantity, "Diet": selectedFish.value.diet, "Temperament": selectedFish.value.temperament, "Min tank size (gallons)": selectedFish.value.min_tank_gallons, "Care notes": selectedFish.value.care_notes } }}'
      }
      editIcon="bold/interface-edit-pencil"
      enableSaveActions={true}
      itemLabelPosition="top"
      labelWrap={true}
    />
  </Body>
  <Footer>
    <NumberInput
      id="numberInputQuantity"
      currency="USD"
      inputValue={0}
      label="Quantity"
      labelPosition="top"
      max="{{ selectedFish.value.quantity || 0 }}"
      min={1}
      placeholder="Enter value"
      showSeparators={true}
      showStepper={true}
      value={1}
    />
    <Button
      id="buttonAddToCart"
      disabled="{{ (selectedFish.value.quantity || 0) <= 0 }}"
      style={{
        borderRadius: "8px",
        background: "warning",
        activeBackground: "success",
      }}
      text="Add to Order"
    >
      <Event
        id="87dd5e1c"
        event="click"
        method="run"
        params={{ map: { src: "jsAddToCart.trigger()" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
  <Event
    id="b2f8018a"
    event="hide"
    method="run"
    params={{ map: { src: "modalFishDetails.setHidden(true)" } }}
    pluginId=""
    type="script"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
