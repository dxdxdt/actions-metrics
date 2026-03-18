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
Updated: 2026-03-18T09:45:03.683537+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.008 |  |
| ap-east-1 | 0.685 |  |
| ap-east-2 | 0.628 |  |
| ap-northeast-1 | 0.510 |  |
| ap-northeast-2 | 0.620 |  |
| ap-northeast-3 | 0.537 |  |
| ap-south-1 | 0.912 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.693 |  |
| ap-southeast-5 | 0.785 |  |
| ap-southeast-6 | 0.722 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.216 | 16 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.517 |  |
| eu-central-2 | 0.546 |  |
| eu-north-1 | 0.577 |  |
| eu-south-1 | 0.557 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.448 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.679 |  |
| me-central-1 | 0.903 |  |
| me-south-1 | 0.873 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.183 | 4300 |
| us-east-2 | 0.167 | 1432 |
| us-gov-east-1 | 0.166 | 1586 |
| us-gov-west-1 | 0.173 | 189 |
| us-west-1 | 0.139 | 3250 |
| us-west-2 | 0.170 | 148 |

