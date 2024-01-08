BUILD_DIR := ./build
SRC_DIR := ./src
PDFS := Resume-Anonymous.pdf Resume-BradleyReynolds.pdf

.PHONY: all
all: $(PDFS)

$(PDFS): %.pdf: $(SRC_DIR)/Resume-BradleyReynolds.tex
	mkdir -p $(BUILD_DIR)
	echo $(basename $@ .tex)
	lualatex -halt-on-error -file-line-error -interaction=nonstopmode -output-directory=$(BUILD_DIR) $(SRC_DIR)/$(basename $@ .tex)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
