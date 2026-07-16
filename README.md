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
Updated: 2026-07-16T22:55:08.124953+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.938 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.694 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.677 |  |
| ap-northeast-3 | 0.592 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.945 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.774 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.925 |  |
| ca-central-1 | 0.122 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.457 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.489 |  |
| eu-south-2 | 0.519 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.424 |  |
| eu-west-3 | 0.443 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.819 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.565 |  |
| us-east-1 | 0.100 | 4874 |
| us-east-2 | 0.106 | 1656 |
| us-gov-east-1 | 0.082 | 1760 |
| us-gov-west-1 | 0.239 | 202 |
| us-west-1 | 0.189 | 3789 |
| us-west-2 | 0.240 | 166 |

