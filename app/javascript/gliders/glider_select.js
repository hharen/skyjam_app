import Choices from 'choices.js'

document.addEventListener('turbolinks:load', function() {
  const c = new Choices(
    '.choices-glider-id',
    {
      callbackOnCreateTemplates: function(template) {
        return {
          item: (classNames, data) => {
            return template(`
              <div class="${classNames.item} ${
              data.highlighted
                ? classNames.highlightedState
                : classNames.itemSelectable
            } ${
              data.placeholder ? classNames.placeholder : ''
            }" data-item data-id="${data.id}" data-value="${data.value}" ${
              data.active ? 'aria-selected="true"' : ''
            } ${data.disabled ? 'aria-disabled="true"' : ''}>
                <span><img src="/gliders/${data.value}.svg"></span> ${data.label}
              </div>
            `);
          },
          choice: (classNames, data) => {
            return template(`
              <div class="${classNames.item} ${classNames.itemChoice} ${
              data.disabled ? classNames.itemDisabled : classNames.itemSelectable
            }" data-select-text="${this.config.itemSelectText}" data-choice ${
              data.disabled
                ? 'data-choice-disabled aria-disabled="true"'
                : 'data-choice-selectable'
            } data-id="${data.id}" data-value="${data.value}" ${
              data.groupId > 0 ? 'role="treeitem"' : 'role="option"'
            }>
                <span><img src="/gliders/${data.value}.svg"></span> ${data.label}
              </div>
            `);
          },
        };
      }
    }
  )
})
