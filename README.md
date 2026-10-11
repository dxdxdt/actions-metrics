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
Updated: 2026-10-11T00:01:52.022560+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.970 |  |
| ap-east-1 | 0.698 |  |
| ap-east-2 | 0.640 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.783 |  |
| ap-southeast-2 | 0.676 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.738 |  |
| ap-southeast-7 | 0.879 |  |
| ca-central-1 | 0.191 | 18 |
| ca-west-1 | 0.178 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.507 |  |
| eu-north-1 | 0.536 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.414 |  |
| eu-west-2 | 0.449 |  |
| eu-west-3 | 0.461 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.618 |  |
| us-east-1 | 0.160 | 5143 |
| us-east-2 | 0.152 | 1693 |
| us-gov-east-1 | 0.153 | 1937 |
| us-gov-west-1 | 0.206 | 237 |
| us-west-1 | 0.139 | 4166 |
| us-west-2 | 0.201 | 194 |

