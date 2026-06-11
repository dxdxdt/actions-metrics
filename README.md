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
Updated: 2026-06-11T05:23:41.908905+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.956 |  |
| ap-east-1 | 0.746 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.567 |  |
| ap-northeast-2 | 0.682 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.825 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.844 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.921 |  |
| ca-central-1 | 0.159 | 16 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.498 |  |
| eu-south-1 | 0.494 |  |
| eu-south-2 | 0.493 |  |
| eu-west-1 | 0.378 |  |
| eu-west-2 | 0.410 |  |
| eu-west-3 | 0.438 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.862 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.568 |  |
| us-east-1 | 0.113 | 4742 |
| us-east-2 | 0.120 | 1631 |
| us-gov-east-1 | 0.117 | 1710 |
| us-gov-west-1 | 0.252 | 198 |
| us-west-1 | 0.190 | 3656 |
| us-west-2 | 0.253 | 162 |

