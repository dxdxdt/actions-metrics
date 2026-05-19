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
Updated: 2026-05-19T23:56:47.110598+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.972 |  |
| ap-east-1 | 0.741 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.561 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.949 |  |
| ap-southeast-1 | 0.811 |  |
| ap-southeast-2 | 0.714 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.918 |  |
| ca-central-1 | 0.167 | 16 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.498 |  |
| eu-south-2 | 0.507 |  |
| eu-west-1 | 0.408 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.636 |  |
| me-central-1 | 0.846 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.201 |  |
| sa-east-1 | 0.600 |  |
| us-east-1 | 0.119 | 4664 |
| us-east-2 | 0.119 | 1603 |
| us-gov-east-1 | 0.113 | 1699 |
| us-gov-west-1 | 0.238 | 195 |
| us-west-1 | 0.179 | 3580 |
| us-west-2 | 0.238 | 158 |

