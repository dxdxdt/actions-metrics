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
Updated: 2026-02-19T22:23:57.224132+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.983 |  |
| ap-east-1 | 0.704 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.685 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.726 |  |
| ap-southeast-5 | 0.801 |  |
| ap-southeast-6 | 0.764 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.201 | 16 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.497 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.514 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.460 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.679 |  |
| me-central-1 | 0.871 |  |
| me-south-1 | 0.832 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.151 | 4147 |
| us-east-2 | 0.147 | 1356 |
| us-gov-east-1 | 0.152 | 1492 |
| us-gov-west-1 | 0.197 | 157 |
| us-west-1 | 0.178 | 3084 |
| us-west-2 | 0.194 | 128 |

