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
Updated: 2026-03-10T15:54:27.630499+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.693 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.516 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.769 |  |
| ap-southeast-2 | 0.665 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.710 |  |
| ap-southeast-5 | 0.787 |  |
| ap-southeast-6 | 0.739 |  |
| ap-southeast-7 | 0.865 |  |
| ca-central-1 | 0.210 | 16 |
| ca-west-1 | 0.190 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.551 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.555 |  |
| eu-south-2 | 0.579 |  |
| eu-west-1 | 0.445 |  |
| eu-west-2 | 0.504 |  |
| eu-west-3 | 0.508 |  |
| il-central-1 | 0.708 |  |
| me-central-1 | 0.883 |  |
| me-south-1 | 0.871 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.179 | 4253 |
| us-east-2 | 0.156 | 1416 |
| us-gov-east-1 | 0.155 | 1554 |
| us-gov-west-1 | 0.174 | 177 |
| us-west-1 | 0.149 | 3206 |
| us-west-2 | 0.172 | 144 |

