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
Updated: 2026-04-01T21:35:50.824538+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.970 |  |
| ap-east-1 | 0.726 |  |
| ap-east-2 | 0.670 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.575 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.948 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.713 |  |
| ap-southeast-3 | 0.860 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.820 |  |
| ap-southeast-6 | 0.786 |  |
| ap-southeast-7 | 0.908 |  |
| ca-central-1 | 0.194 | 16 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.485 |  |
| eu-north-1 | 0.523 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.456 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.850 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.653 |  |
| us-east-1 | 0.138 | 4416 |
| us-east-2 | 0.147 | 1471 |
| us-gov-east-1 | 0.118 | 1619 |
| us-gov-west-1 | 0.221 | 190 |
| us-west-1 | 0.173 | 3333 |
| us-west-2 | 0.230 | 153 |

