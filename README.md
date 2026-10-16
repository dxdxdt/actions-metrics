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
Updated: 2026-10-16T23:10:46.079916+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.527 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.982 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.744 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.166 | 18 |
| ca-west-1 | 0.219 |  |
| eu-central-1 | 0.504 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.540 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.501 |  |
| eu-west-1 | 0.405 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.467 |  |
| il-central-1 | 0.659 |  |
| me-central-1 | 0.953 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.163 | 5148 |
| us-east-2 | 0.143 | 1700 |
| us-gov-east-1 | 0.150 | 1946 |
| us-gov-west-1 | 0.198 | 238 |
| us-west-1 | 0.142 | 4173 |
| us-west-2 | 0.199 | 194 |

