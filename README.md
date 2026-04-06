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
Updated: 2026-04-06T17:39:05.785698+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.035 |  |
| ap-east-1 | 0.651 |  |
| ap-east-2 | 0.585 |  |
| ap-northeast-1 | 0.483 |  |
| ap-northeast-2 | 0.578 |  |
| ap-northeast-3 | 0.495 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.727 |  |
| ap-southeast-2 | 0.638 |  |
| ap-southeast-3 | 0.774 |  |
| ap-southeast-4 | 0.678 |  |
| ap-southeast-5 | 0.744 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.829 |  |
| ca-central-1 | 0.258 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.546 |  |
| eu-central-2 | 0.575 |  |
| eu-north-1 | 0.621 |  |
| eu-south-1 | 0.586 |  |
| eu-south-2 | 0.587 |  |
| eu-west-1 | 0.472 |  |
| eu-west-2 | 0.522 |  |
| eu-west-3 | 0.546 |  |
| il-central-1 | 0.748 |  |
| me-central-1 | 0.928 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.680 |  |
| us-east-1 | 0.209 | 4447 |
| us-east-2 | 0.206 | 1487 |
| us-gov-east-1 | 0.181 | 1630 |
| us-gov-west-1 | 0.139 | 191 |
| us-west-1 | 0.104 | 3365 |
| us-west-2 | 0.136 | 154 |

