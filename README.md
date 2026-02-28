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
Updated: 2026-02-28T18:22:52.668765+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.713 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.690 |  |
| ap-northeast-3 | 0.605 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.850 |  |
| ap-southeast-2 | 0.741 |  |
| ap-southeast-3 | 0.902 |  |
| ap-southeast-4 | 0.784 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.941 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.473 |  |
| eu-south-1 | 0.459 |  |
| eu-south-2 | 0.465 |  |
| eu-west-1 | 0.343 |  |
| eu-west-2 | 0.384 |  |
| eu-west-3 | 0.409 |  |
| il-central-1 | 0.592 |  |
| me-central-1 | 0.801 |  |
| me-south-1 | 0.754 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.089 | 4200 |
| us-east-2 | 0.103 | 1384 |
| us-gov-east-1 | 0.107 | 1518 |
| us-gov-west-1 | 0.256 | 166 |
| us-west-1 | 0.239 | 3142 |
| us-west-2 | 0.268 | 134 |

