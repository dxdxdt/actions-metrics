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
Updated: 2026-02-16T10:42:09.680439+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.009 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.602 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.592 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.639 |  |
| ap-southeast-3 | 0.815 |  |
| ap-southeast-4 | 0.682 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.689 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.253 | 16 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.548 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.564 |  |
| eu-south-2 | 0.570 |  |
| eu-west-1 | 0.464 |  |
| eu-west-2 | 0.499 |  |
| eu-west-3 | 0.504 |  |
| il-central-1 | 0.704 |  |
| me-central-1 | 0.927 |  |
| me-south-1 | 0.888 |  |
| mx-central-1 | 0.263 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.195 | 4129 |
| us-east-2 | 0.191 | 1348 |
| us-gov-east-1 | 0.192 | 1476 |
| us-gov-west-1 | 0.171 | 149 |
| us-west-1 | 0.120 | 3065 |
| us-west-2 | 0.179 | 125 |

