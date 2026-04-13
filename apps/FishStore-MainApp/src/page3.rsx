<Screen
  id="page3"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={2}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="265e4fc5-d58c-4a4d-ba9e-50b4487542d4"
>
  <RetoolAIAgentInvokeQuery
    id="agentChat1_query1"
    action="agentInvoke"
    agentId="0c1ad2ab-d5dd-48f1-80c8-e52999e38f3d"
    agentInputs="{{ agentChat.agentInputs }}"
    agentWorkflowRunMode="async"
    resourceName="RetoolAIAgentInvokeQuery"
    showSuccessToaster={false}
  />
  <Frame
    id="$main3"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="text1"
      horizontalAlign="center"
      value="👋 **Hello {{ current_user.firstName || 'friend' }}!** Get instant help with fish care before or after you order. Ask about feeding schedules, tank requirements, lighting needs, and whether a fish is community-safe. Answers are based on our curated care guides and best practices."
      verticalAlign="center"
    />
    <AgentChat
      id="agentChat"
      queryTargetId="agentChat1_query1"
      style={{ map: { containerBackground: "surfaceSecondary" } }}
    />
  </Frame>
</Screen>
