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
Updated: 2026-02-17T12:43:52.282631+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.019 |  |
| ap-east-1 | 0.694 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.509 |  |
| ap-northeast-2 | 0.615 |  |
| ap-south-1 | 0.960 |  |
| ap-south-2 | 0.962 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.666 |  |
| ap-southeast-3 | 0.814 |  |
| ap-southeast-4 | 0.706 |  |
| ap-southeast-5 | 0.779 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.864 |  |
| ca-central-1 | 0.195 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.545 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.556 |  |
| eu-south-2 | 0.567 |  |
| eu-west-1 | 0.459 |  |
| eu-west-2 | 0.490 |  |
| eu-west-3 | 0.510 |  |
| il-central-1 | 0.704 |  |
| me-central-1 | 0.923 |  |
| me-south-1 | 0.869 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.163 | 4134 |
| us-east-2 | 0.144 | 1351 |
| us-gov-east-1 | 0.141 | 1484 |
| us-gov-west-1 | 0.161 | 153 |
| us-west-1 | 0.164 | 3067 |
| us-west-2 | 0.163 | 126 |

