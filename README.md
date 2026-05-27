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
Updated: 2026-05-27T20:03:47.060973+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.901 |  |
| ap-east-1 | 0.797 |  |
| ap-east-2 | 0.750 |  |
| ap-northeast-1 | 0.619 |  |
| ap-northeast-2 | 0.721 |  |
| ap-northeast-3 | 0.663 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.873 |  |
| ap-southeast-2 | 0.787 |  |
| ap-southeast-3 | 0.914 |  |
| ap-southeast-4 | 0.835 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.822 |  |
| ap-southeast-7 | 0.981 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.451 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.431 |  |
| eu-north-1 | 0.453 |  |
| eu-south-1 | 0.440 |  |
| eu-south-2 | 0.454 |  |
| eu-west-1 | 0.336 |  |
| eu-west-2 | 0.368 |  |
| eu-west-3 | 0.398 |  |
| il-central-1 | 0.572 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.520 |  |
| us-east-1 | 0.073 | 4692 |
| us-east-2 | 0.085 | 1612 |
| us-gov-east-1 | 0.093 | 1706 |
| us-gov-west-1 | 0.298 | 195 |
| us-west-1 | 0.246 | 3610 |
| us-west-2 | 0.301 | 161 |

