package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
)

type {{.StructName}}Service struct {
}

// Create{{.StructName}} 创建{{.StructName}}记录
// Author [qauzy](https://github.com/qauzy)
func ({{.Abbreviation}}Service *{{.StructName}}Service) Create{{.StructName}}({{.Abbreviation}} autocode.{{.StructName}}) (err error) {
	err = global.GVA_DB.Create(&{{.Abbreviation}}).Error
	return err
}

// Delete{{.StructName}} 删除{{.StructName}}记录
// Author [qauzy](https://github.com/qauzy)
func ({{.Abbreviation}}Service *{{.StructName}}Service)Delete{{.StructName}}({{.Abbreviation}} autocode.{{.StructName}}) (err error) {
	err = global.GVA_DB.Delete(&{{.Abbreviation}}).Error
	return err
}

// Delete{{.StructName}}ByIds 批量删除{{.StructName}}记录
// Author [qauzy](https://github.com/qauzy)
func ({{.Abbreviation}}Service *{{.StructName}}Service)Delete{{.StructName}}ByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.{{.StructName}}{},"id in ?",ids.Ids).Error
	return err
}

// Update{{.StructName}} 更新{{.StructName}}记录
// Author [qauzy](https://github.com/qauzy)
func ({{.Abbreviation}}Service *{{.StructName}}Service)Update{{.StructName}}({{.Abbreviation}} autocode.{{.StructName}}) (err error) {
	err = global.GVA_DB.Save(&{{.Abbreviation}}).Error
	return err
}

// Get{{.StructName}} 根据id获取{{.StructName}}记录
// Author [qauzy](https://github.com/qauzy)
func ({{.Abbreviation}}Service *{{.StructName}}Service)Get{{.StructName}}(id uint) (err error, {{.Abbreviation}} autocode.{{.StructName}}) {
	err = global.GVA_DB.Where("id = ?", id).First(&{{.Abbreviation}}).Error
	return
}

// Get{{.StructName}}InfoList 分页获取{{.StructName}}记录
// Author [qauzy](https://github.com/qauzy)
func ({{.Abbreviation}}Service *{{.StructName}}Service)Get{{.StructName}}InfoList(info autoCodeReq.{{.StructName}}Search) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&autocode.{{.StructName}}{})
    var {{.Abbreviation}}s []autocode.{{.StructName}}
    // 如果有条件搜索 下方会自动创建搜索语句
        {{- range .Fields}}
            {{- if .FieldSearchType}}
                {{- if eq .FieldType "string" }}
     {{if ne .FieldSearchType "RANGE"}}
    if info.{{.FieldName}} != "" {
        db = db.Where("{{.ColumnName}} {{.FieldSearchType}} ?",{{if eq .FieldSearchType "LIKE"}}"%"+ {{ end }}info.{{.FieldName}}{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
    {{- else }}
    if info.{{.FieldName}}Min != "" {
        db = db.Where("{{.ColumnName}} >= ?",{{if eq .FieldSearchType "LIKE"}}"%"+ {{ end }}info.{{.FieldName}}Min{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
    if info.{{.FieldName}}Max != "" {
        db = db.Where("{{.ColumnName}} <= ?",{{if eq .FieldSearchType "LIKE"}}"%"+ {{ end }}info.{{.FieldName}}Max{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
    {{- end }}

                {{- else if eq .FieldType "bool" }}
        {{if ne .FieldSearchType "RANGE"}}
    if info.{{.FieldName}} != nil {
        db = db.Where("{{.ColumnName}} {{.FieldSearchType}} ?",{{if eq .FieldSearchType "LIKE"}}"%"+{{ end }}info.{{.FieldName}}{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
        {{- else }}
    if info.{{.FieldName}}Min != nil {
        db = db.Where("{{.ColumnName}} >= ?",{{if eq .FieldSearchType "LIKE"}}"%"+ {{ end }}info.{{.FieldName}}Min{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
    if info.{{.FieldName}}Max != nil {
        db = db.Where("{{.ColumnName}} <= ?",{{if eq .FieldSearchType "LIKE"}}"%"+ {{ end }}info.{{.FieldName}}Max{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
        {{- end }}
                {{- else if eq .FieldType "int" }}
        {{if ne .FieldSearchType "RANGE"}}
    if info.{{.FieldName}} != nil {
        db = db.Where("{{.ColumnName}} {{.FieldSearchType}} ?",{{if eq .FieldSearchType "LIKE"}}"%"+{{ end }}info.{{.FieldName}}{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
        {{- else }}
    if info.{{.FieldName}}Min != nil {
        db = db.Where("{{.ColumnName}} >= ?",{{if eq .FieldSearchType "LIKE"}}"%"+ {{ end }}info.{{.FieldName}}Min{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
    if info.{{.FieldName}}Max != nil {
        db = db.Where("{{.ColumnName}} <= ?",{{if eq .FieldSearchType "LIKE"}}"%"+ {{ end }}info.{{.FieldName}}Max{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
        {{- end }}
                {{- else if eq .FieldType "float64" }}
        {{if ne .FieldSearchType "RANGE"}}
    if info.{{.FieldName}} != nil {
        db = db.Where("{{.ColumnName}} {{.FieldSearchType}} ?",{{if eq .FieldSearchType "LIKE"}}"%"+{{ end }}info.{{.FieldName}}{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
        {{- else }}
    if info.{{.FieldName}}Min != nil {
        db = db.Where("{{.ColumnName}} >= ?",{{if eq .FieldSearchType "LIKE"}}"%"+ {{ end }}info.{{.FieldName}}Min{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
    if info.{{.FieldName}}Max != nil {
        db = db.Where("{{.ColumnName}} <= ?",{{if eq .FieldSearchType "LIKE"}}"%"+ {{ end }}info.{{.FieldName}}Max{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
        {{- end }}
                {{- else if eq .FieldType "time.Time" }}
        {{if ne .FieldSearchType "RANGE"}}
    if info.{{.FieldName}} != nil {
        db = db.Where("{{.ColumnName}} {{.FieldSearchType}} ?",{{if eq .FieldSearchType "LIKE"}}"%"+{{ end }}info.{{.FieldName}}{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
        {{- else }}
    if info.{{.FieldName}}Min != nil {
        db = db.Where("{{.ColumnName}} >= ?",{{if eq .FieldSearchType "LIKE"}}"%"+ {{ end }}info.{{.FieldName}}Min{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
    if info.{{.FieldName}}Max != nil {
        db = db.Where("{{.ColumnName}} <= ?",{{if eq .FieldSearchType "LIKE"}}"%"+ {{ end }}info.{{.FieldName}}Max{{if eq .FieldSearchType "LIKE"}}+"%"{{ end }})
    }
        {{- end }}
                {{- end }}
        {{- end }}
    {{- end }}
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&{{.Abbreviation}}s).Error
	return err, {{.Abbreviation}}s, total
}
