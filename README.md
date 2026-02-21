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
Updated: 2026-02-21T12:30:58.989310+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.723 |  |
| ap-east-2 | 0.662 |  |
| ap-northeast-1 | 0.544 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.573 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.745 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.791 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.154 | 16 |
| ca-west-1 | 0.191 |  |
| eu-central-1 | 0.491 |  |
| eu-central-2 | 0.504 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.410 |  |
| eu-west-2 | 0.449 |  |
| eu-west-3 | 0.476 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.866 |  |
| me-south-1 | 0.819 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.132 | 4157 |
| us-east-2 | 0.107 | 1361 |
| us-gov-east-1 | 0.108 | 1498 |
| us-gov-west-1 | 0.195 | 160 |
| us-west-1 | 0.198 | 3091 |
| us-west-2 | 0.197 | 129 |

