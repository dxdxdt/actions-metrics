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
Updated: 2026-04-28T22:04:11.688157+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.946 |  |
| ap-east-1 | 0.767 |  |
| ap-east-2 | 0.706 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.687 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.745 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.796 |  |
| ap-southeast-5 | 0.861 |  |
| ap-southeast-6 | 0.789 |  |
| ap-southeast-7 | 0.955 |  |
| ca-central-1 | 0.130 | 16 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.458 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.504 |  |
| eu-south-1 | 0.475 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.430 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.807 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.558 |  |
| us-east-1 | 0.099 | 4575 |
| us-east-2 | 0.088 | 1543 |
| us-gov-east-1 | 0.093 | 1666 |
| us-gov-west-1 | 0.257 | 194 |
| us-west-1 | 0.209 | 3496 |
| us-west-2 | 0.256 | 157 |

