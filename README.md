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
Updated: 2026-09-21T17:32:45.988184+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.720 |  |
| ap-east-2 | 0.656 |  |
| ap-northeast-1 | 0.538 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.562 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.990 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.696 |  |
| ap-southeast-3 | 0.868 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.840 |  |
| ap-southeast-6 | 0.766 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.158 | 18 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.497 |  |
| eu-central-2 | 0.500 |  |
| eu-north-1 | 0.520 |  |
| eu-south-1 | 0.507 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.442 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.185 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.126 | 5111 |
| us-east-2 | 0.119 | 1686 |
| us-gov-east-1 | 0.103 | 1923 |
| us-gov-west-1 | 0.211 | 234 |
| us-west-1 | 0.152 | 4131 |
| us-west-2 | 0.211 | 192 |

