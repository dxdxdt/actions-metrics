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
Updated: 2026-08-02T22:47:52.241728+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.921 |  |
| ap-east-1 | 0.747 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.681 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.853 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.830 |  |
| ap-southeast-2 | 0.725 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.766 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.933 |  |
| ca-central-1 | 0.170 | 17 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.443 |  |
| eu-central-2 | 0.467 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.475 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.368 |  |
| eu-west-2 | 0.407 |  |
| eu-west-3 | 0.422 |  |
| il-central-1 | 0.605 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.555 |  |
| us-east-1 | 0.119 | 4934 |
| us-east-2 | 0.131 | 1673 |
| us-gov-east-1 | 0.134 | 1798 |
| us-gov-west-1 | 0.247 | 209 |
| us-west-1 | 0.185 | 3875 |
| us-west-2 | 0.246 | 172 |

