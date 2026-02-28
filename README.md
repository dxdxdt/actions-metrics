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
Updated: 2026-02-28T11:13:39.111690+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.631 |  |
| ap-northeast-1 | 0.518 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.542 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.773 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.825 |  |
| ap-southeast-4 | 0.717 |  |
| ap-southeast-5 | 0.791 |  |
| ap-southeast-6 | 0.717 |  |
| ap-southeast-7 | 0.874 |  |
| ca-central-1 | 0.191 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.503 |  |
| eu-central-2 | 0.521 |  |
| eu-north-1 | 0.559 |  |
| eu-south-1 | 0.530 |  |
| eu-south-2 | 0.540 |  |
| eu-west-1 | 0.429 |  |
| eu-west-2 | 0.463 |  |
| eu-west-3 | 0.483 |  |
| il-central-1 | 0.669 |  |
| me-central-1 | 0.876 |  |
| me-south-1 | 0.829 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.603 |  |
| us-east-1 | 0.156 | 4197 |
| us-east-2 | 0.139 | 1383 |
| us-gov-east-1 | 0.137 | 1518 |
| us-gov-west-1 | 0.182 | 165 |
| us-west-1 | 0.165 | 3141 |
| us-west-2 | 0.185 | 133 |

