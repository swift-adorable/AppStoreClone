.PHONY: githooks_checkout

# Tuist 경로 설정 (필요에 따라 수정)
TUIST_PATH ?= tuist

githooks_checkout:
	@echo "Generating project with Tuist..."
	@echo "Using Tuist path: $(TUIST_PATH)"  # Tuist 경로 출력
	@$(TUIST_PATH) generate
