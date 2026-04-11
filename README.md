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
Updated: 2026-04-11T11:25:03.089063+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.946 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.677 |  |
| ap-northeast-3 | 0.601 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.825 |  |
| ap-southeast-2 | 0.742 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.774 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.842 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.120 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.458 |  |
| eu-central-2 | 0.470 |  |
| eu-north-1 | 0.504 |  |
| eu-south-1 | 0.477 |  |
| eu-south-2 | 0.493 |  |
| eu-west-1 | 0.380 |  |
| eu-west-2 | 0.414 |  |
| eu-west-3 | 0.435 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.560 |  |
| us-east-1 | 0.101 | 4476 |
| us-east-2 | 0.083 | 1493 |
| us-gov-east-1 | 0.086 | 1641 |
| us-gov-west-1 | 0.249 | 192 |
| us-west-1 | 0.198 | 3395 |
| us-west-2 | 0.245 | 155 |

