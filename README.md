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
Updated: 2026-04-30T19:08:26.410403+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.492 |  |
| ap-northeast-2 | 0.601 |  |
| ap-northeast-3 | 0.522 |  |
| ap-south-1 | 0.925 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.751 |  |
| ap-southeast-2 | 0.661 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.696 |  |
| ap-southeast-5 | 0.768 |  |
| ap-southeast-6 | 0.689 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.227 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.548 |  |
| eu-north-1 | 0.590 |  |
| eu-south-1 | 0.559 |  |
| eu-south-2 | 0.568 |  |
| eu-west-1 | 0.482 |  |
| eu-west-2 | 0.501 |  |
| eu-west-3 | 0.520 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.891 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.649 |  |
| us-east-1 | 0.174 | 4576 |
| us-east-2 | 0.167 | 1551 |
| us-gov-east-1 | 0.160 | 1668 |
| us-gov-west-1 | 0.189 | 194 |
| us-west-1 | 0.128 | 3506 |
| us-west-2 | 0.185 | 157 |

