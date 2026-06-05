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
Updated: 2026-06-05T22:11:16.240592+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.676 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.666 |  |
| ap-northeast-3 | 0.590 |  |
| ap-south-1 | 0.856 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.721 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.917 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.504 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.398 |  |
| eu-west-2 | 0.429 |  |
| eu-west-3 | 0.452 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.572 |  |
| us-east-1 | 0.131 | 4724 |
| us-east-2 | 0.121 | 1625 |
| us-gov-east-1 | 0.130 | 1709 |
| us-gov-west-1 | 0.229 | 196 |
| us-west-1 | 0.184 | 3636 |
| us-west-2 | 0.234 | 162 |

