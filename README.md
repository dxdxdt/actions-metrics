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
Updated: 2026-04-14T15:07:54.732956+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.887 |  |
| ap-east-1 | 0.811 |  |
| ap-east-2 | 0.744 |  |
| ap-northeast-1 | 0.641 |  |
| ap-northeast-2 | 0.754 |  |
| ap-northeast-3 | 0.668 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.888 |  |
| ap-southeast-2 | 0.815 |  |
| ap-southeast-3 | 0.951 |  |
| ap-southeast-4 | 0.859 |  |
| ap-southeast-5 | 0.898 |  |
| ap-southeast-6 | 0.862 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.101 | 16 |
| ca-west-1 | 0.280 |  |
| eu-central-1 | 0.396 |  |
| eu-central-2 | 0.411 |  |
| eu-north-1 | 0.453 |  |
| eu-south-1 | 0.415 |  |
| eu-south-2 | 0.432 |  |
| eu-west-1 | 0.320 |  |
| eu-west-2 | 0.352 |  |
| eu-west-3 | 0.376 |  |
| il-central-1 | 0.558 |  |
| me-central-1 | 0.771 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.492 |  |
| us-east-1 | 0.055 | 4502 |
| us-east-2 | 0.084 | 1500 |
| us-gov-east-1 | 0.085 | 1646 |
| us-gov-west-1 | 0.340 | 193 |
| us-west-1 | 0.277 | 3410 |
| us-west-2 | 0.321 | 155 |

