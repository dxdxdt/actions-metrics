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
Updated: 2026-04-26T01:59:24.576474+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.677 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.662 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.765 |  |
| ap-southeast-5 | 0.832 |  |
| ap-southeast-6 | 0.764 |  |
| ap-southeast-7 | 0.921 |  |
| ca-central-1 | 0.175 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.478 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.385 |  |
| eu-west-2 | 0.416 |  |
| eu-west-3 | 0.430 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.116 | 4565 |
| us-east-2 | 0.141 | 1532 |
| us-gov-east-1 | 0.128 | 1664 |
| us-gov-west-1 | 0.260 | 194 |
| us-west-1 | 0.196 | 3481 |
| us-west-2 | 0.248 | 157 |

