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
Updated: 2026-06-10T17:53:16.414234+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.938 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.699 |  |
| ap-northeast-1 | 0.575 |  |
| ap-northeast-2 | 0.684 |  |
| ap-northeast-3 | 0.599 |  |
| ap-south-1 | 0.851 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.825 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.763 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.937 |  |
| ca-central-1 | 0.179 | 16 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.493 |  |
| eu-south-2 | 0.484 |  |
| eu-west-1 | 0.372 |  |
| eu-west-2 | 0.414 |  |
| eu-west-3 | 0.427 |  |
| il-central-1 | 0.611 |  |
| me-central-1 | 0.874 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.559 |  |
| us-east-1 | 0.129 | 4740 |
| us-east-2 | 0.143 | 1630 |
| us-gov-east-1 | 0.153 | 1710 |
| us-gov-west-1 | 0.254 | 198 |
| us-west-1 | 0.199 | 3655 |
| us-west-2 | 0.254 | 162 |

