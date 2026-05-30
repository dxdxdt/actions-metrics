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
Updated: 2026-05-30T15:00:34.211106+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.957 |  |
| ap-east-1 | 0.729 |  |
| ap-east-2 | 0.674 |  |
| ap-northeast-1 | 0.551 |  |
| ap-northeast-2 | 0.666 |  |
| ap-northeast-3 | 0.577 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.743 |  |
| ap-southeast-5 | 0.823 |  |
| ap-southeast-6 | 0.752 |  |
| ap-southeast-7 | 0.920 |  |
| ca-central-1 | 0.198 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.475 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.500 |  |
| eu-south-2 | 0.513 |  |
| eu-west-1 | 0.395 |  |
| eu-west-2 | 0.438 |  |
| eu-west-3 | 0.452 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.966 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.586 |  |
| us-east-1 | 0.145 | 4700 |
| us-east-2 | 0.163 | 1614 |
| us-gov-east-1 | 0.151 | 1708 |
| us-gov-west-1 | 0.232 | 195 |
| us-west-1 | 0.171 | 3621 |
| us-west-2 | 0.233 | 161 |

