// 自动生成模板{{.StructName}}Dto
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// {{.StructName}}Dto 结构体
// 如果含有time.Time 请自行import time包
type {{.StructName}}Dto struct {
      {{- range .Fields}}
        {{- if .FieldSearchType}}
            {{if ne .FieldSearchType "RANGE"}}
                 {{- if ne .FieldType "string" }}
      {{.FieldName}}  *{{.FieldType}} `json:"{{.FieldJson}}" form:"{{.FieldJson}}"`
                 {{- else }}
      {{.FieldName}}  {{.FieldType}} `json:"{{.FieldJson}}" form:"{{.FieldJson}}"`
                 {{- end }}
            {{- else }}
                  {{- if ne .FieldType "string" }}
      {{.FieldName}}Max  *{{.FieldType}} `json:"{{.FieldJson}}Max" form:"{{.FieldJson}}Max"`
      {{.FieldName}}Min  *{{.FieldType}} `json:"{{.FieldJson}}Min" form:"{{.FieldJson}}Min"`
                  {{- else }}
      {{.FieldName}}Max  {{.FieldType}} `json:"{{.FieldJson}}Max" form:"{{.FieldJson}}Max"`
      {{.FieldName}}Min  {{.FieldType}} `json:"{{.FieldJson}}Min" form:"{{.FieldJson}}Min"`
                  {{- end }}
             {{- end }}
        {{- end }}
      {{- end }}
}
