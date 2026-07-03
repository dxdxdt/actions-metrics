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
Updated: 2026-07-03T06:24:02.014316+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.721 |  |
| ap-east-2 | 0.661 |  |
| ap-northeast-1 | 0.543 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.568 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.795 |  |
| ap-southeast-2 | 0.695 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.717 |  |
| ap-southeast-7 | 0.898 |  |
| ca-central-1 | 0.194 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.481 |  |
| eu-central-2 | 0.509 |  |
| eu-north-1 | 0.524 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.397 |  |
| eu-west-2 | 0.451 |  |
| eu-west-3 | 0.462 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.902 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.217 |  |
| sa-east-1 | 0.602 |  |
| us-east-1 | 0.158 | 4813 |
| us-east-2 | 0.130 | 1650 |
| us-gov-east-1 | 0.139 | 1728 |
| us-gov-west-1 | 0.209 | 200 |
| us-west-1 | 0.151 | 3732 |
| us-west-2 | 0.211 | 164 |

