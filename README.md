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
Updated: 2026-04-16T04:47:42.466749+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.721 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.538 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.569 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.943 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.925 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.737 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.201 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.526 |  |
| eu-north-1 | 0.558 |  |
| eu-south-1 | 0.518 |  |
| eu-south-2 | 0.538 |  |
| eu-west-1 | 0.429 |  |
| eu-west-2 | 0.466 |  |
| eu-west-3 | 0.479 |  |
| il-central-1 | 0.669 |  |
| me-central-1 | 0.873 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.136 | 4509 |
| us-east-2 | 0.116 | 1503 |
| us-gov-east-1 | 0.121 | 1650 |
| us-gov-west-1 | 0.211 | 193 |
| us-west-1 | 0.155 | 3419 |
| us-west-2 | 0.213 | 156 |

