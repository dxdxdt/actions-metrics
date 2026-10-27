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
Updated: 2026-10-27T01:48:28.365358+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.866 |  |
| ap-east-1 | 0.639 |  |
| ap-east-2 | 0.590 |  |
| ap-northeast-1 | 0.482 |  |
| ap-northeast-2 | 0.624 |  |
| ap-northeast-3 | 0.506 |  |
| ap-south-1 | 0.805 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.707 |  |
| ap-southeast-2 | 0.621 |  |
| ap-southeast-3 | 0.756 |  |
| ap-southeast-4 | 0.686 |  |
| ap-southeast-5 | 0.722 |  |
| ap-southeast-6 | 0.670 |  |
| ap-southeast-7 | 0.794 |  |
| ca-central-1 | 0.177 | 18 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.468 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.465 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.368 |  |
| eu-west-2 | 0.406 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.198 |  |
| sa-east-1 | 0.535 |  |
| us-east-1 | 0.145 | 5161 |
| us-east-2 | 0.139 | 1712 |
| us-gov-east-1 | 0.143 | 1955 |
| us-gov-west-1 | 0.206 | 240 |
| us-west-1 | 0.150 | 4196 |
| us-west-2 | 0.206 | 195 |

