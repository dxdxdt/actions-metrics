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
Updated: 2026-06-04T10:56:59.797158+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.910 |  |
| ap-east-1 | 0.806 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.626 |  |
| ap-northeast-2 | 0.735 |  |
| ap-northeast-3 | 0.642 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.777 |  |
| ap-southeast-3 | 0.944 |  |
| ap-southeast-4 | 0.827 |  |
| ap-southeast-5 | 0.897 |  |
| ap-southeast-6 | 0.813 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.121 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.424 |  |
| eu-central-2 | 0.437 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.474 |  |
| eu-south-2 | 0.461 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.371 |  |
| eu-west-3 | 0.406 |  |
| il-central-1 | 0.581 |  |
| me-central-1 | 0.824 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.519 |  |
| us-east-1 | 0.080 | 4718 |
| us-east-2 | 0.093 | 1623 |
| us-gov-east-1 | 0.095 | 1708 |
| us-gov-west-1 | 0.294 | 196 |
| us-west-1 | 0.238 | 3632 |
| us-west-2 | 0.293 | 162 |

