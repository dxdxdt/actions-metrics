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
Updated: 2026-07-06T16:13:55.924580+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.959 |  |
| ap-east-1 | 0.740 |  |
| ap-east-2 | 0.679 |  |
| ap-northeast-1 | 0.563 |  |
| ap-northeast-2 | 0.665 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.872 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.739 |  |
| ap-southeast-7 | 0.921 |  |
| ca-central-1 | 0.161 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.476 |  |
| eu-central-2 | 0.494 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.398 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.459 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.850 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.133 | 4828 |
| us-east-2 | 0.119 | 1654 |
| us-gov-east-1 | 0.120 | 1729 |
| us-gov-west-1 | 0.229 | 201 |
| us-west-1 | 0.174 | 3748 |
| us-west-2 | 0.230 | 164 |

