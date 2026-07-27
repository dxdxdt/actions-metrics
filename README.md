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
Updated: 2026-07-27T16:09:48.773725+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.724 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.544 |  |
| ap-northeast-2 | 0.648 |  |
| ap-northeast-3 | 0.576 |  |
| ap-south-1 | 0.933 |  |
| ap-south-2 | 1.013 |  |
| ap-southeast-1 | 0.798 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.853 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.817 |  |
| ap-southeast-6 | 0.730 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.152 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.497 |  |
| eu-north-1 | 0.547 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.184 |  |
| sa-east-1 | 0.585 |  |
| us-east-1 | 0.126 | 4914 |
| us-east-2 | 0.090 | 1670 |
| us-gov-east-1 | 0.096 | 1780 |
| us-gov-west-1 | 0.222 | 207 |
| us-west-1 | 0.164 | 3842 |
| us-west-2 | 0.221 | 170 |

