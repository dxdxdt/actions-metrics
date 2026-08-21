# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-08-21T03:43:41.487898+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.926 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.605 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.745 |  |
| ap-southeast-3 | 0.886 |  |
| ap-southeast-4 | 0.784 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.781 |  |
| ap-southeast-7 | 0.936 |  |
| ca-central-1 | 0.171 | 18 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.447 |  |
| eu-central-2 | 0.470 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.469 |  |
| eu-south-2 | 0.475 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.423 |  |
| il-central-1 | 0.595 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.544 |  |
| us-east-1 | 0.104 | 5034 |
| us-east-2 | 0.132 | 1680 |
| us-gov-east-1 | 0.140 | 1863 |
| us-gov-west-1 | 0.269 | 224 |
| us-west-1 | 0.214 | 4007 |
| us-west-2 | 0.269 | 184 |

