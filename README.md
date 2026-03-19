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
Updated: 2026-03-19T08:34:11.995641+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.051 |  |
| ap-east-1 | 0.667 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.486 |  |
| ap-northeast-2 | 0.596 |  |
| ap-northeast-3 | 0.512 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.743 |  |
| ap-southeast-2 | 0.637 |  |
| ap-southeast-3 | 0.798 |  |
| ap-southeast-4 | 0.680 |  |
| ap-southeast-5 | 0.759 |  |
| ap-southeast-6 | 0.678 |  |
| ap-southeast-7 | 0.843 |  |
| ca-central-1 | 0.272 | 16 |
| ca-west-1 | 0.192 |  |
| eu-central-1 | 0.567 |  |
| eu-central-2 | 0.586 |  |
| eu-north-1 | 0.607 |  |
| eu-south-1 | 0.591 |  |
| eu-south-2 | 0.601 |  |
| eu-west-1 | 0.479 |  |
| eu-west-2 | 0.524 |  |
| eu-west-3 | 0.549 |  |
| il-central-1 | 0.750 |  |
| me-central-1 | 0.927 |  |
| me-south-1 | 0.883 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.661 |  |
| us-east-1 | 0.204 | 4309 |
| us-east-2 | 0.206 | 1436 |
| us-gov-east-1 | 0.225 | 1586 |
| us-gov-west-1 | 0.158 | 189 |
| us-west-1 | 0.104 | 3255 |
| us-west-2 | 0.157 | 148 |

