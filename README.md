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
Updated: 2026-07-31T20:56:06.246966+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.781 |  |
| ap-east-2 | 0.724 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.707 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.842 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.754 |  |
| ap-southeast-3 | 0.909 |  |
| ap-southeast-4 | 0.811 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.800 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.120 | 17 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.418 |  |
| eu-central-2 | 0.435 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.439 |  |
| eu-south-2 | 0.443 |  |
| eu-west-1 | 0.330 |  |
| eu-west-2 | 0.370 |  |
| eu-west-3 | 0.397 |  |
| il-central-1 | 0.570 |  |
| me-central-1 | 0.776 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.522 |  |
| us-east-1 | 0.079 | 4926 |
| us-east-2 | 0.096 | 1673 |
| us-gov-east-1 | 0.103 | 1791 |
| us-gov-west-1 | 0.277 | 208 |
| us-west-1 | 0.231 | 3860 |
| us-west-2 | 0.278 | 172 |

